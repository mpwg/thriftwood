// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../exceptions/api_exception.dart';

enum AuthType { none, apiKey, bearer, basic }

class HttpClientConfig {
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Duration sendTimeout;
  final AuthType authType;
  final String? apiKey;
  final String? apiKeyHeader;
  final String? bearerToken;
  final String? basicUsername;
  final String? basicPassword;
  final Map<String, String>? defaultHeaders;
  final Map<String, String>? defaultQueryParameters;
  final bool enableRetry;
  final int maxRetryAttempts;
  final Duration initialRetryDelay;
  final bool enableLogging;
  final bool validateCertificates;

  const HttpClientConfig({
    required this.baseUrl,
    this.connectTimeout = const Duration(seconds: 30),
    this.receiveTimeout = const Duration(seconds: 30),
    this.sendTimeout = const Duration(seconds: 30),
    this.authType = AuthType.none,
    this.apiKey,
    this.apiKeyHeader = 'X-API-Key',
    this.bearerToken,
    this.basicUsername,
    this.basicPassword,
    this.defaultHeaders,
    this.defaultQueryParameters,
    this.enableRetry = true,
    this.maxRetryAttempts = 3,
    this.initialRetryDelay = const Duration(milliseconds: 500),
    this.enableLogging = false,
    this.validateCertificates = true,
  });
}

class AppHttpClient {
  late final Dio _dio;
  final HttpClientConfig _config;
  final Connectivity _connectivity;
  final Random _random = Random();

  AppHttpClient._({
    required HttpClientConfig config,
    required Connectivity connectivity,
    required Dio dio,
  }) : _config = config,
       _connectivity = connectivity {
    _dio = dio;
  }

  static Future<AppHttpClient> create({
    required HttpClientConfig config,
    Connectivity? connectivity,
    Dio? dio,
  }) async {
    final client = AppHttpClient._(
      config: config,
      connectivity: connectivity ?? Connectivity(),
      dio: dio ?? Dio(),
    );
    await client._setupDio();
    return client;
  }

  Future<void> _setupDio() async {
    String userAgent = 'ThriftwoodApp/1.0.0 (${Platform.operatingSystem})';

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      userAgent =
          '${packageInfo.appName}/${packageInfo.version} (${Platform.operatingSystem})';
    } catch (e) {
      // Use default user agent if package info is not available (e.g., in tests)
    }

    _dio.options = BaseOptions(
      baseUrl: _config.baseUrl,
      connectTimeout: _config.connectTimeout,
      receiveTimeout: _config.receiveTimeout,
      sendTimeout: _config.sendTimeout,
      headers: {
        'User-Agent': userAgent,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        ..._config.defaultHeaders ?? {},
      },
      queryParameters: _config.defaultQueryParameters ?? {},
      validateStatus: (status) => status != null && status < 500,
    );

    if (!_config.validateCertificates) {
      final adapter = _dio.httpClientAdapter;
      if (adapter is IOHttpClientAdapter) {
        adapter.createHttpClient = () {
          final client = HttpClient();
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        };
      }
    }

    _setupAuth();

    if (_config.enableLogging) {
      _dio.interceptors.add(_createLoggingInterceptor());
    }

    if (_config.enableRetry) {
      _dio.interceptors.add(_createRetryInterceptor());
    }
  }

  void _setupAuth() {
    switch (_config.authType) {
      case AuthType.apiKey:
        if (_config.apiKey != null && _config.apiKeyHeader != null) {
          _dio.options.headers[_config.apiKeyHeader!] = _config.apiKey!;
        }
        break;
      case AuthType.bearer:
        if (_config.bearerToken != null) {
          _dio.options.headers['Authorization'] =
              'Bearer ${_config.bearerToken!}';
        }
        break;
      case AuthType.basic:
        if (_config.basicUsername != null && _config.basicPassword != null) {
          final credentials = base64Encode(
            utf8.encode('${_config.basicUsername}:${_config.basicPassword}'),
          );
          _dio.options.headers['Authorization'] = 'Basic $credentials';
        }
        break;
      case AuthType.none:
        break;
    }
  }

  Interceptor _createLoggingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        print('🌐 HTTP ${options.method.toUpperCase()} ${options.uri}');

        if (options.data != null) {
          final sanitizedData = _sanitizeData(options.data);
          print('📤 Request Data: $sanitizedData');
        }

        if (options.queryParameters.isNotEmpty) {
          final sanitizedParams = _sanitizeData(options.queryParameters);
          print('🔍 Query Params: $sanitizedParams');
        }

        print('📋 Headers: ${_sanitizeHeaders(options.headers)}');
        handler.next(options);
      },
      onResponse: (response, handler) {
        print('✅ HTTP ${response.statusCode} ${response.requestOptions.uri}');

        if (response.data != null) {
          final sanitizedResponse = _sanitizeData(response.data);
          print('📥 Response Data: $sanitizedResponse');
        }

        handler.next(response);
      },
      onError: (error, handler) {
        print(
          '❌ HTTP Error ${error.response?.statusCode} ${error.requestOptions.uri}',
        );
        print('🔥 Error: ${error.message}');

        if (error.response?.data != null) {
          final sanitizedError = _sanitizeData(error.response!.data);
          print('💥 Error Data: $sanitizedError');
        }

        handler.next(error);
      },
    );
  }

  Interceptor _createRetryInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) async {
        final apiException = ApiException.fromDioException(error);

        if (!apiException.isRetryable) {
          handler.next(error);
          return;
        }

        final attempt =
            error.requestOptions.extra['retry_attempt'] as int? ?? 0;

        if (attempt >= _config.maxRetryAttempts) {
          handler.next(error);
          return;
        }

        final isConnected = await _checkConnectivity();
        if (!isConnected) {
          handler.next(error);
          return;
        }

        final delay = _calculateRetryDelay(attempt);
        print(
          '🔄 Retrying request (attempt ${attempt + 1}/${_config.maxRetryAttempts}) after ${delay.inMilliseconds}ms',
        );

        await Future.delayed(delay);

        final retryOptions = error.requestOptions.copyWith(
          extra: {'retry_attempt': attempt + 1},
        );

        try {
          final response = await _dio.fetch(retryOptions);
          handler.resolve(response);
        } catch (retryError) {
          if (retryError is DioException) {
            handler.next(retryError);
          } else {
            handler.next(error);
          }
        }
      },
    );
  }

  Duration _calculateRetryDelay(int attempt) {
    final baseDelay = _config.initialRetryDelay.inMilliseconds;
    final exponentialDelay = baseDelay * pow(2, attempt);
    final jitter = _random.nextInt(1000);
    return Duration(milliseconds: exponentialDelay.toInt() + jitter);
  }

  Future<bool> _checkConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result.any(
        (connectivity) => connectivity != ConnectivityResult.none,
      );
    } catch (_) {
      return true; // Assume connected if check fails
    }
  }

  Map<String, dynamic> _sanitizeData(dynamic data) {
    if (data is Map) {
      return data.map(
        (key, value) => MapEntry(
          key.toString(),
          _shouldRedact(key.toString()) ? '[REDACTED]' : value,
        ),
      );
    }
    return {'data': data.toString()};
  }

  Map<String, String> _sanitizeHeaders(Map<String, dynamic> headers) {
    return headers.map(
      (key, value) =>
          MapEntry(key, _shouldRedact(key) ? '[REDACTED]' : value.toString()),
    );
  }

  bool _shouldRedact(String key) {
    final sensitiveKeys = [
      'authorization',
      'x-api-key',
      'apikey',
      'token',
      'password',
      'secret',
      'credential',
      'auth',
    ];

    return sensitiveKeys.any(
      (sensitive) => key.toLowerCase().contains(sensitive.toLowerCase()),
    );
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse<T>(response.data, fromJson);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    } catch (e) {
      throw ApiException.unknown(
        message: 'Unexpected error during GET request',
        details: e.toString(),
        originalError: e,
      );
    }
  }

  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse<T>(response.data, fromJson);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    } catch (e) {
      throw ApiException.unknown(
        message: 'Unexpected error during POST request',
        details: e.toString(),
        originalError: e,
      );
    }
  }

  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse<T>(response.data, fromJson);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    } catch (e) {
      throw ApiException.unknown(
        message: 'Unexpected error during PUT request',
        details: e.toString(),
        originalError: e,
      );
    }
  }

  Future<T> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.delete<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse<T>(response.data, fromJson);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    } catch (e) {
      throw ApiException.unknown(
        message: 'Unexpected error during DELETE request',
        details: e.toString(),
        originalError: e,
      );
    }
  }

  T _parseResponse<T>(dynamic data, T Function(dynamic)? fromJson) {
    try {
      if (fromJson != null) {
        return fromJson(data);
      }

      return data as T;
    } catch (e) {
      throw ApiException.serialization(
        message: 'Failed to parse response data',
        details: 'Expected type: $T, Actual data: $data',
        originalError: e,
      );
    }
  }

  void updateConfig(HttpClientConfig newConfig) {
    // Create new instance with updated config
    // This is a simplified approach - in production you might want to update existing instance
    throw UnimplementedError(
      'Config update not implemented - create new instance instead',
    );
  }

  void dispose() {
    _dio.close();
  }
}
