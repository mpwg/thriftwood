import 'package:flutter_test/flutter_test.dart';
import 'package:thriftwood/services/http_client.dart';
import 'package:thriftwood/exceptions/api_exception.dart';

void main() {
  group('HttpClient Integration Tests', () {
    late AppHttpClient httpClient;

    setUpAll(() {
      const config = HttpClientConfig(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        enableRetry: true,
        maxRetryAttempts: 2,
        enableLogging: true,
      );

      httpClient = AppHttpClient(config: config);
    });

    tearDownAll(() {
      httpClient.dispose();
    });

    test(
      'should make successful GET request to real API',
      () async {
        final result = await httpClient.get<Map<String, dynamic>>(
          '/posts/1',
          fromJson: (data) => data as Map<String, dynamic>,
        );

        expect(result['id'], 1);
        expect(result['userId'], isNotNull);
        expect(result['title'], isNotNull);
        expect(result['body'], isNotNull);
      },
      timeout: const Timeout(Duration(seconds: 10)),
    );

    test(
      'should make successful POST request to real API',
      () async {
        final postData = {
          'title': 'Test Post',
          'body': 'This is a test post',
          'userId': 1,
        };

        final result = await httpClient.post<Map<String, dynamic>>(
          '/posts',
          data: postData,
          fromJson: (data) => data as Map<String, dynamic>,
        );

        expect(result['title'], 'Test Post');
        expect(result['body'], 'This is a test post');
        expect(result['userId'], 1);
        expect(result['id'], isNotNull);
      },
      timeout: const Timeout(Duration(seconds: 10)),
    );

    test(
      'should handle 404 errors correctly',
      () async {
        // JSONPlaceholder returns {} for non-existent resources instead of 404
        // Let's test this endpoint that actually returns 404
        try {
          await httpClient.get<Map<String, dynamic>>(
            '/posts/invalid-endpoint-that-does-not-exist',
          );
          fail('Expected an exception to be thrown');
        } catch (e) {
          expect(e, isA<ApiException>());
        }
      },
      timeout: const Timeout(Duration(seconds: 10)),
    );

    test(
      'should handle network connectivity',
      () async {
        const config = HttpClientConfig(
          baseUrl: 'https://nonexistent-domain-that-should-not-exist-12345.com',
          connectTimeout: Duration(seconds: 2),
          enableRetry: false,
          enableLogging: false,
        );

        final badClient = AppHttpClient(config: config);

        expect(
          () => badClient.get<Map<String, dynamic>>('/test'),
          throwsA(isA<ApiException>()),
        );

        badClient.dispose();
      },
      timeout: const Timeout(Duration(seconds: 5)),
    );

    test('should parse list responses', () async {
      final result = await httpClient.get<List<dynamic>>(
        '/posts',
        fromJson: (data) => data as List<dynamic>,
      );

      expect(result, isA<List>());
      expect(result.length, greaterThan(0));

      final firstPost = result.first as Map<String, dynamic>;
      expect(firstPost['id'], isNotNull);
      expect(firstPost['title'], isNotNull);
    }, timeout: const Timeout(Duration(seconds: 10)));

    test(
      'should handle query parameters in real requests',
      () async {
        final result = await httpClient.get<List<dynamic>>(
          '/posts',
          queryParameters: {'userId': '1'},
          fromJson: (data) => data as List<dynamic>,
        );

        expect(result, isA<List>());
        expect(result.length, greaterThan(0));

        // All posts should belong to userId 1
        for (final post in result) {
          final postMap = post as Map<String, dynamic>;
          expect(postMap['userId'], 1);
        }
      },
      timeout: const Timeout(Duration(seconds: 10)),
    );
  });
}

extension on AppHttpClient {
  void dispose() {
    // This would dispose the Dio instance in the real implementation
  }
}
