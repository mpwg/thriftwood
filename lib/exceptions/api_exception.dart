import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_exception.freezed.dart';

@freezed
class ApiException with _$ApiException implements Exception {
  const factory ApiException.network({
    required String message,
    String? details,
    Object? originalError,
  }) = NetworkException;

  const factory ApiException.timeout({
    required String message,
    String? details,
    int? timeoutDuration,
  }) = TimeoutException;

  const factory ApiException.server({
    required String message,
    required int statusCode,
    String? details,
    String? endpoint,
    Map<String, dynamic>? responseData,
  }) = ServerException;

  const factory ApiException.client({
    required String message,
    required int statusCode,
    String? details,
    String? endpoint,
    Map<String, dynamic>? responseData,
  }) = ClientException;

  const factory ApiException.authentication({
    required String message,
    String? details,
    String? endpoint,
  }) = AuthenticationException;

  const factory ApiException.authorization({
    required String message,
    String? details,
    String? endpoint,
  }) = AuthorizationException;

  const factory ApiException.validation({
    required String message,
    Map<String, String>? fieldErrors,
    String? details,
  }) = ValidationException;

  const factory ApiException.serialization({
    required String message,
    String? details,
    Object? originalError,
  }) = SerializationException;

  const factory ApiException.unknown({
    required String message,
    String? details,
    Object? originalError,
  }) = UnknownException;

  factory ApiException.fromDioException(DioException dioException) {
    final message = dioException.message ?? 'An error occurred';
    final endpoint = dioException.requestOptions.path;

    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException.timeout(
          message: 'Request timed out',
          details: message,
          timeoutDuration:
              dioException.requestOptions.connectTimeout?.inMilliseconds,
        );

      case DioExceptionType.connectionError:
        return ApiException.network(
          message: 'Network connection failed',
          details: message,
          originalError: dioException.error,
        );

      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode ?? 0;
        final responseData =
            dioException.response?.data as Map<String, dynamic>?;

        if (statusCode == 401) {
          return ApiException.authentication(
            message: 'Authentication failed',
            details: message,
            endpoint: endpoint,
          );
        }

        if (statusCode == 403) {
          return ApiException.authorization(
            message: 'Access denied',
            details: message,
            endpoint: endpoint,
          );
        }

        if (statusCode >= 400 && statusCode < 500) {
          return ApiException.client(
            message: 'Client error',
            statusCode: statusCode,
            details: message,
            endpoint: endpoint,
            responseData: responseData,
          );
        }

        if (statusCode >= 500) {
          return ApiException.server(
            message: 'Server error',
            statusCode: statusCode,
            details: message,
            endpoint: endpoint,
            responseData: responseData,
          );
        }

        return ApiException.unknown(
          message: message,
          details: 'Unexpected response status: $statusCode',
          originalError: dioException,
        );

      case DioExceptionType.cancel:
        return ApiException.unknown(
          message: 'Request was cancelled',
          details: message,
          originalError: dioException,
        );

      case DioExceptionType.unknown:
        return ApiException.unknown(
          message: message,
          details: 'Unknown error occurred',
          originalError: dioException,
        );

      case DioExceptionType.badCertificate:
        return ApiException.network(
          message: 'SSL certificate validation failed',
          details: message,
          originalError: dioException,
        );
    }
  }
}

extension ApiExceptionExtension on ApiException {
  bool get isRetryable => when(
    network: (_, __, ___) => true,
    timeout: (_, __, ___) => true,
    server: (_, statusCode, __, ___, ____) => statusCode >= 500,
    client: (_, __, ___, ____, _____) => false,
    authentication: (_, __, ___) => false,
    authorization: (_, __, ___) => false,
    validation: (_, __, ___) => false,
    serialization: (_, __, ___) => false,
    unknown: (_, __, ___) => false,
  );

  String get userFriendlyMessage => when(
    network: (_, __, ___) =>
        'Please check your internet connection and try again.',
    timeout: (_, __, ___) => 'The request timed out. Please try again.',
    server: (_, __, ___, ____, _____) =>
        'Server is temporarily unavailable. Please try again later.',
    client: (_, statusCode, __, ___, ____) => statusCode == 404
        ? 'The requested resource was not found.'
        : 'Invalid request. Please check your input.',
    authentication: (_, __, ___) =>
        'Please check your authentication credentials.',
    authorization: (_, __, ___) =>
        'You do not have permission to access this resource.',
    validation: (_, fieldErrors, __) =>
        fieldErrors?.values.first ?? 'Please check your input.',
    serialization: (_, __, ___) => 'Data format error. Please try again.',
    unknown: (_, __, ___) => 'An unexpected error occurred. Please try again.',
  );
}
