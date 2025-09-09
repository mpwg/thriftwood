import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:thriftwood/exceptions/api_exception.dart';

void main() {
  group('ApiException', () {
    group('fromDioException', () {
      test('should convert connection timeout to TimeoutException', () {
        final dioException = DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(path: '/test'),
          message: 'Connection timeout',
        );

        final apiException = ApiException.fromDioException(dioException);

        expect(apiException, isA<TimeoutException>());
        apiException.when(
          timeout: (message, details, timeoutDuration) {
            expect(message, 'Request timed out');
            expect(details, 'Connection timeout');
          },
          network: (_, __, ___) => fail('Should be timeout exception'),
          server: (_, __, ___, ____, _____) => fail('Should be timeout exception'),
          client: (_, __, ___, ____, _____) => fail('Should be timeout exception'),
          authentication: (_, __, ___) => fail('Should be timeout exception'),
          authorization: (_, __, ___) => fail('Should be timeout exception'),
          validation: (_, __, ___) => fail('Should be timeout exception'),
          serialization: (_, __, ___) => fail('Should be timeout exception'),
          unknown: (_, __, ___) => fail('Should be timeout exception'),
        );
      });

      test('should convert connection error to NetworkException', () {
        final dioException = DioException(
          type: DioExceptionType.connectionError,
          requestOptions: RequestOptions(path: '/test'),
          message: 'Network error',
        );

        final apiException = ApiException.fromDioException(dioException);

        expect(apiException, isA<NetworkException>());
        apiException.when(
          network: (message, details, originalError) {
            expect(message, 'Network connection failed');
            expect(details, 'Network error');
          },
          timeout: (_, __, ___) => fail('Should be network exception'),
          server: (_, __, ___, ____, _____) => fail('Should be network exception'),
          client: (_, __, ___, ____, _____) => fail('Should be network exception'),
          authentication: (_, __, ___) => fail('Should be network exception'),
          authorization: (_, __, ___) => fail('Should be network exception'),
          validation: (_, __, ___) => fail('Should be network exception'),
          serialization: (_, __, ___) => fail('Should be network exception'),
          unknown: (_, __, ___) => fail('Should be network exception'),
        );
      });

      test('should convert 401 status to AuthenticationException', () {
        final response = Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: '/test'),
        );
        
        final dioException = DioException(
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(path: '/test'),
          response: response,
          message: 'Unauthorized',
        );

        final apiException = ApiException.fromDioException(dioException);

        expect(apiException, isA<AuthenticationException>());
        apiException.when(
          authentication: (message, details, endpoint) {
            expect(message, 'Authentication failed');
            expect(details, 'Unauthorized');
            expect(endpoint, '/test');
          },
          network: (_, __, ___) => fail('Should be authentication exception'),
          timeout: (_, __, ___) => fail('Should be authentication exception'),
          server: (_, __, ___, ____, _____) => fail('Should be authentication exception'),
          client: (_, __, ___, ____, _____) => fail('Should be authentication exception'),
          authorization: (_, __, ___) => fail('Should be authentication exception'),
          validation: (_, __, ___) => fail('Should be authentication exception'),
          serialization: (_, __, ___) => fail('Should be authentication exception'),
          unknown: (_, __, ___) => fail('Should be authentication exception'),
        );
      });

      test('should convert 403 status to AuthorizationException', () {
        final response = Response(
          statusCode: 403,
          requestOptions: RequestOptions(path: '/test'),
        );
        
        final dioException = DioException(
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(path: '/test'),
          response: response,
          message: 'Forbidden',
        );

        final apiException = ApiException.fromDioException(dioException);

        expect(apiException, isA<AuthorizationException>());
      });

      test('should convert 400-499 status to ClientException', () {
        final response = Response(
          statusCode: 400,
          requestOptions: RequestOptions(path: '/test'),
        );
        
        final dioException = DioException(
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(path: '/test'),
          response: response,
          message: 'Bad Request',
        );

        final apiException = ApiException.fromDioException(dioException);

        expect(apiException, isA<ClientException>());
        apiException.when(
          client: (message, statusCode, details, endpoint, responseData) {
            expect(statusCode, 400);
            expect(endpoint, '/test');
          },
          network: (_, __, ___) => fail('Should be client exception'),
          timeout: (_, __, ___) => fail('Should be client exception'),
          server: (_, __, ___, ____, _____) => fail('Should be client exception'),
          authentication: (_, __, ___) => fail('Should be client exception'),
          authorization: (_, __, ___) => fail('Should be client exception'),
          validation: (_, __, ___) => fail('Should be client exception'),
          serialization: (_, __, ___) => fail('Should be client exception'),
          unknown: (_, __, ___) => fail('Should be client exception'),
        );
      });

      test('should convert 500+ status to ServerException', () {
        final response = Response(
          statusCode: 500,
          requestOptions: RequestOptions(path: '/test'),
        );
        
        final dioException = DioException(
          type: DioExceptionType.badResponse,
          requestOptions: RequestOptions(path: '/test'),
          response: response,
          message: 'Internal Server Error',
        );

        final apiException = ApiException.fromDioException(dioException);

        expect(apiException, isA<ServerException>());
        apiException.when(
          server: (message, statusCode, details, endpoint, responseData) {
            expect(statusCode, 500);
            expect(endpoint, '/test');
          },
          network: (_, __, ___) => fail('Should be server exception'),
          timeout: (_, __, ___) => fail('Should be server exception'),
          client: (_, __, ___, ____, _____) => fail('Should be server exception'),
          authentication: (_, __, ___) => fail('Should be server exception'),
          authorization: (_, __, ___) => fail('Should be server exception'),
          validation: (_, __, ___) => fail('Should be server exception'),
          serialization: (_, __, ___) => fail('Should be server exception'),
          unknown: (_, __, ___) => fail('Should be server exception'),
        );
      });
    });

    group('isRetryable extension', () {
      test('network exceptions should be retryable', () {
        const exception = ApiException.network(message: 'Network error');
        expect(exception.isRetryable, true);
      });

      test('timeout exceptions should be retryable', () {
        const exception = ApiException.timeout(message: 'Timeout');
        expect(exception.isRetryable, true);
      });

      test('server exceptions (5xx) should be retryable', () {
        const exception = ApiException.server(
          message: 'Server error',
          statusCode: 500,
        );
        expect(exception.isRetryable, true);
      });

      test('client exceptions (4xx) should not be retryable', () {
        const exception = ApiException.client(
          message: 'Client error',
          statusCode: 400,
        );
        expect(exception.isRetryable, false);
      });

      test('authentication exceptions should not be retryable', () {
        const exception = ApiException.authentication(message: 'Auth failed');
        expect(exception.isRetryable, false);
      });

      test('validation exceptions should not be retryable', () {
        const exception = ApiException.validation(message: 'Validation failed');
        expect(exception.isRetryable, false);
      });
    });

    group('userFriendlyMessage extension', () {
      test('should provide user-friendly message for network errors', () {
        const exception = ApiException.network(message: 'Network error');
        expect(exception.userFriendlyMessage, 'Please check your internet connection and try again.');
      });

      test('should provide user-friendly message for timeout errors', () {
        const exception = ApiException.timeout(message: 'Timeout');
        expect(exception.userFriendlyMessage, 'The request timed out. Please try again.');
      });

      test('should provide user-friendly message for authentication errors', () {
        const exception = ApiException.authentication(message: 'Auth failed');
        expect(exception.userFriendlyMessage, 'Please check your authentication credentials.');
      });

      test('should provide user-friendly message for 404 errors', () {
        const exception = ApiException.client(
          message: 'Not found',
          statusCode: 404,
        );
        expect(exception.userFriendlyMessage, 'The requested resource was not found.');
      });

      test('should provide user-friendly message for validation errors with field errors', () {
        const exception = ApiException.validation(
          message: 'Validation failed',
          fieldErrors: {'email': 'Invalid email format'},
        );
        expect(exception.userFriendlyMessage, 'Invalid email format');
      });
    });

    group('factory constructors', () {
      test('should create network exception with all fields', () {
        const exception = ApiException.network(
          message: 'Network error',
          details: 'Connection refused',
          originalError: 'Original error',
        );

        exception.when(
          network: (message, details, originalError) {
            expect(message, 'Network error');
            expect(details, 'Connection refused');
            expect(originalError, 'Original error');
          },
          timeout: (_, __, ___) => fail('Should be network exception'),
          server: (_, __, ___, ____, _____) => fail('Should be network exception'),
          client: (_, __, ___, ____, _____) => fail('Should be network exception'),
          authentication: (_, __, ___) => fail('Should be network exception'),
          authorization: (_, __, ___) => fail('Should be network exception'),
          validation: (_, __, ___) => fail('Should be network exception'),
          serialization: (_, __, ___) => fail('Should be network exception'),
          unknown: (_, __, ___) => fail('Should be network exception'),
        );
      });

      test('should create validation exception with field errors', () {
        const exception = ApiException.validation(
          message: 'Validation failed',
          fieldErrors: {
            'email': 'Invalid email',
            'password': 'Too short'
          },
        );

        exception.when(
          validation: (message, fieldErrors, details) {
            expect(message, 'Validation failed');
            expect(fieldErrors?['email'], 'Invalid email');
            expect(fieldErrors?['password'], 'Too short');
          },
          network: (_, __, ___) => fail('Should be validation exception'),
          timeout: (_, __, ___) => fail('Should be validation exception'),
          server: (_, __, ___, ____, _____) => fail('Should be validation exception'),
          client: (_, __, ___, ____, _____) => fail('Should be validation exception'),
          authentication: (_, __, ___) => fail('Should be validation exception'),
          authorization: (_, __, ___) => fail('Should be validation exception'),
          serialization: (_, __, ___) => fail('Should be validation exception'),
          unknown: (_, __, ___) => fail('Should be validation exception'),
        );
      });
    });
  });
}