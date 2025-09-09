import 'package:flutter_test/flutter_test.dart';
import 'package:thriftwood/services/http_client.dart';
import 'package:thriftwood/exceptions/api_exception.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HttpClientConfig', () {
    test('should create config with default values', () {
      const config = HttpClientConfig(baseUrl: 'https://api.example.com');

      expect(config.baseUrl, 'https://api.example.com');
      expect(config.connectTimeout, const Duration(seconds: 30));
      expect(config.authType, AuthType.none);
      expect(config.enableRetry, true);
      expect(config.maxRetryAttempts, 3);
      expect(config.initialRetryDelay, const Duration(milliseconds: 500));
    });

    test('should create config with custom values', () {
      const config = HttpClientConfig(
        baseUrl: 'https://custom.api.com',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 20),
        authType: AuthType.apiKey,
        apiKey: 'test-key',
        apiKeyHeader: 'X-Custom-Key',
        enableRetry: false,
        maxRetryAttempts: 5,
        enableLogging: true,
        validateCertificates: false,
        defaultHeaders: {'Custom-Header': 'Value'},
        defaultQueryParameters: {'version': 'v1'},
      );

      expect(config.baseUrl, 'https://custom.api.com');
      expect(config.connectTimeout, const Duration(seconds: 10));
      expect(config.receiveTimeout, const Duration(seconds: 20));
      expect(config.authType, AuthType.apiKey);
      expect(config.apiKey, 'test-key');
      expect(config.apiKeyHeader, 'X-Custom-Key');
      expect(config.enableRetry, false);
      expect(config.maxRetryAttempts, 5);
      expect(config.enableLogging, true);
      expect(config.validateCertificates, false);
      expect(config.defaultHeaders?['Custom-Header'], 'Value');
      expect(config.defaultQueryParameters?['version'], 'v1');
    });

    test('should have correct default auth values', () {
      const config = HttpClientConfig(
        baseUrl: 'https://api.example.com',
        authType: AuthType.basic,
        basicUsername: 'user',
        basicPassword: 'pass',
      );

      expect(config.authType, AuthType.basic);
      expect(config.basicUsername, 'user');
      expect(config.basicPassword, 'pass');
    });
  });

  group('AuthType enum', () {
    test('should have all expected auth types', () {
      expect(AuthType.values, hasLength(4));
      expect(AuthType.values, contains(AuthType.none));
      expect(AuthType.values, contains(AuthType.apiKey));
      expect(AuthType.values, contains(AuthType.bearer));
      expect(AuthType.values, contains(AuthType.basic));
    });
  });

  group('AppHttpClient creation', () {
    test('should create client with minimum config', () {
      const config = HttpClientConfig(
        baseUrl: 'https://api.example.com',
        enableRetry: false,
        enableLogging: false,
      );

      expect(() => AppHttpClient(config: config), returnsNormally);
    });
  });

  group('Exception handling logic', () {
    test('should identify retryable exceptions correctly', () {
      const networkException = ApiException.network(message: 'Network error');
      const timeoutException = ApiException.timeout(message: 'Timeout');
      const serverException = ApiException.server(
        message: 'Server error',
        statusCode: 500,
      );
      const clientException = ApiException.client(
        message: 'Client error',
        statusCode: 400,
      );
      const authException = ApiException.authentication(message: 'Auth error');

      expect(networkException.isRetryable, true);
      expect(timeoutException.isRetryable, true);
      expect(serverException.isRetryable, true);
      expect(clientException.isRetryable, false);
      expect(authException.isRetryable, false);
    });

    test('should provide user-friendly messages', () {
      const networkException = ApiException.network(message: 'Network error');
      const timeoutException = ApiException.timeout(message: 'Timeout');
      const authException = ApiException.authentication(message: 'Auth error');
      const validationException = ApiException.validation(
        message: 'Validation error',
        fieldErrors: {'email': 'Invalid format'},
      );

      expect(
        networkException.userFriendlyMessage,
        'Please check your internet connection and try again.',
      );
      expect(
        timeoutException.userFriendlyMessage,
        'The request timed out. Please try again.',
      );
      expect(
        authException.userFriendlyMessage,
        'Please check your authentication credentials.',
      );
      expect(validationException.userFriendlyMessage, 'Invalid format');
    });
  });

  group('Configuration validation', () {
    test('should handle missing API key gracefully', () {
      const config = HttpClientConfig(
        baseUrl: 'https://api.example.com',
        authType: AuthType.apiKey,
        // apiKey intentionally missing
        enableRetry: false,
        enableLogging: false,
      );

      expect(() => AppHttpClient(config: config), returnsNormally);
    });

    test('should handle missing bearer token gracefully', () {
      const config = HttpClientConfig(
        baseUrl: 'https://api.example.com',
        authType: AuthType.bearer,
        // bearerToken intentionally missing
        enableRetry: false,
        enableLogging: false,
      );

      expect(() => AppHttpClient(config: config), returnsNormally);
    });

    test('should handle incomplete basic auth gracefully', () {
      const config = HttpClientConfig(
        baseUrl: 'https://api.example.com',
        authType: AuthType.basic,
        basicUsername: 'user',
        // basicPassword intentionally missing
        enableRetry: false,
        enableLogging: false,
      );

      expect(() => AppHttpClient(config: config), returnsNormally);
    });
  });
}
