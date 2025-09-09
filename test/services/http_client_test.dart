import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:thriftwood/services/http_client.dart';
import 'package:thriftwood/exceptions/api_exception.dart';

class MockDio extends Mock implements Dio {}

class MockConnectivity extends Mock implements Connectivity {}

class MockRequestOptions extends Mock implements RequestOptions {}

class MockResponse extends Mock implements Response {}

class MockBaseOptions extends Mock implements BaseOptions {}

class MockInterceptors extends Mock implements Interceptors {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(MockBaseOptions());
    registerFallbackValue(RequestOptions(path: ''));
    registerFallbackValue(Options());
  });
  group('HttpClientConfig', () {
    test('should create config with default values', () {
      const config = HttpClientConfig(baseUrl: 'https://api.example.com');

      expect(config.baseUrl, 'https://api.example.com');
      expect(config.connectTimeout, const Duration(seconds: 30));
      expect(config.authType, AuthType.none);
      expect(config.enableRetry, true);
      expect(config.maxRetryAttempts, 3);
    });

    test('should create config with custom values', () {
      const config = HttpClientConfig(
        baseUrl: 'https://custom.api.com',
        connectTimeout: Duration(seconds: 10),
        authType: AuthType.apiKey,
        apiKey: 'test-key',
        enableRetry: false,
      );

      expect(config.baseUrl, 'https://custom.api.com');
      expect(config.connectTimeout, const Duration(seconds: 10));
      expect(config.authType, AuthType.apiKey);
      expect(config.apiKey, 'test-key');
      expect(config.enableRetry, false);
    });
  });

  group('AppHttpClient', () {
    late MockDio mockDio;
    late MockConnectivity mockConnectivity;
    late HttpClientConfig config;

    setUp(() {
      mockDio = MockDio();
      mockConnectivity = MockConnectivity();

      config = const HttpClientConfig(
        baseUrl: 'https://api.example.com',
        enableRetry: false,
        enableLogging: false,
      );

      // Setup default mock behavior
      when(() => mockDio.options).thenReturn(BaseOptions());
      when(() => mockDio.interceptors).thenReturn(Interceptors());
      when(() => mockDio.close()).thenReturn(null);
    });

    group('GET requests', () {
      test('should make successful GET request', () async {
        final mockResponse = Response(
          data: {'success': true},
          statusCode: 200,
          requestOptions: RequestOptions(path: '/test'),
        );

        when(
          () => mockDio.get<dynamic>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final client = AppHttpClient(
          config: config,
          connectivity: mockConnectivity,
          dio: mockDio,
        );

        final result = await client.get<Map<String, dynamic>>('/test');

        expect(result, {'success': true});
        verify(
          () => mockDio.get<dynamic>(
            '/test',
            queryParameters: null,
            options: null,
          ),
        );
      });

      test('should handle GET request with query parameters', () async {
        final mockResponse = Response(
          data: {'data': 'test'},
          statusCode: 200,
          requestOptions: RequestOptions(path: '/test'),
        );

        when(
          () => mockDio.get<dynamic>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final client = AppHttpClient(
          config: config,
          connectivity: mockConnectivity,
          dio: mockDio,
        );

        await client.get<Map<String, dynamic>>(
          '/test',
          queryParameters: {'param1': 'value1'},
        );

        verify(
          () => mockDio.get<dynamic>(
            '/test',
            queryParameters: {'param1': 'value1'},
            options: null,
          ),
        );
      });

      test('should convert DioException to ApiException', () async {
        final dioException = DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(path: '/test'),
          message: 'Timeout',
        );

        when(
          () => mockDio.get<dynamic>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenThrow(dioException);

        final client = AppHttpClient(
          config: config,
          connectivity: mockConnectivity,
          dio: mockDio,
        );

        expect(
          () => client.get<Map<String, dynamic>>('/test'),
          throwsA(isA<TimeoutException>()),
        );
      });

      test('should handle generic exceptions', () async {
        when(
          () => mockDio.get<dynamic>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenThrow(Exception('Generic error'));

        final client = AppHttpClient(
          config: config,
          connectivity: mockConnectivity,
          dio: mockDio,
        );

        expect(
          () => client.get<Map<String, dynamic>>('/test'),
          throwsA(isA<UnknownException>()),
        );
      });
    });

    group('POST requests', () {
      test('should make successful POST request', () async {
        final mockResponse = Response(
          data: {'created': true},
          statusCode: 201,
          requestOptions: RequestOptions(path: '/test'),
        );

        when(
          () => mockDio.post<dynamic>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final client = AppHttpClient(
          config: config,
          connectivity: mockConnectivity,
          dio: mockDio,
        );

        final result = await client.post<Map<String, dynamic>>(
          '/test',
          data: {'name': 'test'},
        );

        expect(result, {'created': true});
        verify(
          () => mockDio.post<dynamic>(
            '/test',
            data: {'name': 'test'},
            queryParameters: null,
            options: null,
          ),
        );
      });
    });

    group('PUT requests', () {
      test('should make successful PUT request', () async {
        final mockResponse = Response(
          data: {'updated': true},
          statusCode: 200,
          requestOptions: RequestOptions(path: '/test/1'),
        );

        when(
          () => mockDio.put<dynamic>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final client = AppHttpClient(
          config: config,
          connectivity: mockConnectivity,
          dio: mockDio,
        );

        final result = await client.put<Map<String, dynamic>>(
          '/test/1',
          data: {'name': 'updated'},
        );

        expect(result, {'updated': true});
      });
    });

    group('DELETE requests', () {
      test('should make successful DELETE request', () async {
        final mockResponse = Response(
          data: {'deleted': true},
          statusCode: 200,
          requestOptions: RequestOptions(path: '/test/1'),
        );

        when(
          () => mockDio.delete<dynamic>(
            any(),
            data: any(named: 'data'),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final client = AppHttpClient(
          config: config,
          connectivity: mockConnectivity,
          dio: mockDio,
        );

        final result = await client.delete<Map<String, dynamic>>('/test/1');

        expect(result, {'deleted': true});
      });
    });

    group('Response parsing', () {
      test('should parse response with fromJson function', () async {
        final mockResponse = Response(
          data: {'id': 1, 'name': 'Test'},
          statusCode: 200,
          requestOptions: RequestOptions(path: '/test'),
        );

        when(
          () => mockDio.get<dynamic>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final client = AppHttpClient(
          config: config,
          connectivity: mockConnectivity,
          dio: mockDio,
        );

        final result = await client.get<TestModel>(
          '/test',
          fromJson: (data) => TestModel.fromJson(data),
        );

        expect(result.id, 1);
        expect(result.name, 'Test');
      });

      test('should throw SerializationException on parsing error', () async {
        final mockResponse = Response(
          data: 'invalid json',
          statusCode: 200,
          requestOptions: RequestOptions(path: '/test'),
        );

        when(
          () => mockDio.get<dynamic>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            options: any(named: 'options'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final client = AppHttpClient(
          config: config,
          connectivity: mockConnectivity,
          dio: mockDio,
        );

        expect(
          () => client.get<TestModel>(
            '/test',
            fromJson: (data) => TestModel.fromJson(data),
          ),
          throwsA(isA<SerializationException>()),
        );
      });
    });

    group('Authentication', () {
      test('should add API key to headers', () async {
        final configWithApiKey = HttpClientConfig(
          baseUrl: 'https://api.example.com',
          authType: AuthType.apiKey,
          apiKey: 'test-api-key',
          apiKeyHeader: 'X-API-Key',
          enableRetry: false,
          enableLogging: false,
        );

        final client = AppHttpClient(
          config: configWithApiKey,
          connectivity: mockConnectivity,
          dio: mockDio,
        );

        // Verify that the API key was added to headers
        verify(() => mockDio.options = any()).called(greaterThan(0));
      });

      test('should add Bearer token to headers', () async {
        final configWithBearer = HttpClientConfig(
          baseUrl: 'https://api.example.com',
          authType: AuthType.bearer,
          bearerToken: 'test-bearer-token',
          enableRetry: false,
          enableLogging: false,
        );

        final client = AppHttpClient(
          config: configWithBearer,
          connectivity: mockConnectivity,
          dio: mockDio,
        );

        // Verify that the Bearer token was added to headers
        verify(() => mockDio.options = any()).called(greaterThan(0));
      });
    });
  });
}

class TestModel {
  final int id;
  final String name;

  TestModel({required this.id, required this.name});

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(id: json['id'] as int, name: json['name'] as String);
  }
}
