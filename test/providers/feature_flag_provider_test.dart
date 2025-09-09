import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thriftwood/models/feature_flag.dart';
import 'package:thriftwood/providers/feature_flag_provider.dart';

void main() {
  group('FeatureFlagService', () {
    late ProviderContainer container;
    late FeatureFlagService service;

    setUp(() {
      container = ProviderContainer();
      service = container.read(featureFlagServiceProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test('should initialize with default flags', () {
      final flags = service.getAllFlags();
      expect(flags.containsKey('example_feature'), true);
      expect(service.isEnabled('example_feature'), false);
    });

    test('should set and get feature flags', () {
      service.setFlag('test_feature', true, description: 'Test feature');

      expect(service.isEnabled('test_feature'), true);

      final flag = service.getFlag('test_feature');
      expect(flag?.key, 'test_feature');
      expect(flag?.enabled, true);
      expect(flag?.description, 'Test feature');
    });

    test('should update existing flags', () {
      service.setFlag('test_feature', false);
      expect(service.isEnabled('test_feature'), false);

      service.setFlag('test_feature', true);
      expect(service.isEnabled('test_feature'), true);
    });

    test('should return false for non-existent flags', () {
      expect(service.isEnabled('non_existent_flag'), false);
      expect(service.getFlag('non_existent_flag'), null);
    });

    test('should return build time overrides', () {
      final overrides = service.getBuildTimeOverrides();
      expect(overrides, isA<Map<String, dynamic>>());
    });
  });

  group('FeatureFlagProvider', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('should provide feature flag service', () {
      final flags = container.read(featureFlagServiceProvider);
      expect(flags, isA<Map<String, FeatureFlag>>());
    });

    test('should provide individual flag states', () {
      final service = container.read(featureFlagServiceProvider.notifier);
      service.setFlag('provider_test', true);

      final isEnabled = container.read(featureFlagProvider('provider_test'));
      expect(isEnabled, true);
    });

    test('should update when flag changes', () {
      final service = container.read(featureFlagServiceProvider.notifier);

      // Initial state
      expect(container.read(featureFlagProvider('dynamic_test')), false);

      // Update flag
      service.setFlag('dynamic_test', true);

      // Should reflect the change since provider watches the state
      expect(container.read(featureFlagProvider('dynamic_test')), true);
    });
  });

  group('FeatureFlag model', () {
    test('should create feature flag with required fields', () {
      const flag = FeatureFlag(key: 'test_key', enabled: true);

      expect(flag.key, 'test_key');
      expect(flag.enabled, true);
      expect(flag.description, null);
      expect(flag.environmentOverride, null);
    });

    test('should create feature flag with all fields', () {
      const flag = FeatureFlag(
        key: 'test_key',
        enabled: false,
        description: 'Test description',
        environmentOverride: 'TEST_OVERRIDE',
      );

      expect(flag.key, 'test_key');
      expect(flag.enabled, false);
      expect(flag.description, 'Test description');
      expect(flag.environmentOverride, 'TEST_OVERRIDE');
    });

    test('should support JSON serialization', () {
      const flag = FeatureFlag(
        key: 'json_test',
        enabled: true,
        description: 'JSON test',
      );

      final json = flag.toJson();
      expect(json['key'], 'json_test');
      expect(json['enabled'], true);
      expect(json['description'], 'JSON test');

      final reconstructed = FeatureFlag.fromJson(json);
      expect(reconstructed, flag);
    });
  });

  group('FeatureFlagConfig model', () {
    test('should create empty config by default', () {
      const config = FeatureFlagConfig();

      expect(config.flags, isEmpty);
      expect(config.buildTimeOverrides, isEmpty);
    });

    test('should create config with data', () {
      const flag = FeatureFlag(key: 'test', enabled: true);
      const config = FeatureFlagConfig(
        flags: {'test': flag},
        buildTimeOverrides: {'override': true},
      );

      expect(config.flags['test'], flag);
      expect(config.buildTimeOverrides['override'], true);
    });
  });
}
