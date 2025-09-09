import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/feature_flag.dart';

class FeatureFlagService extends Notifier<Map<String, FeatureFlag>> {
  final Map<String, dynamic> _buildTimeOverrides = {};

  @override
  Map<String, FeatureFlag> build() {
    _loadBuildTimeOverrides();
    return _initializeDefaultFlags();
  }

  Map<String, FeatureFlag> _initializeDefaultFlags() {
    return {
      'example_feature': const FeatureFlag(
        key: 'example_feature',
        enabled: false,
        description: 'Example feature flag for demonstration',
      ),
    };
  }

  void _loadBuildTimeOverrides() {
    const overrides = String.fromEnvironment(
      'FEATURE_FLAGS',
      defaultValue: '{}',
    );
    try {
      if (overrides.isNotEmpty && overrides != '{}') {
        final decoded = Uri.decodeComponent(overrides);
        // Simple key=value parsing for dart-define
        final pairs = decoded.split(',');
        for (final pair in pairs) {
          final keyValue = pair.split('=');
          if (keyValue.length == 2) {
            final key = keyValue[0].trim();
            final value = keyValue[1].trim().toLowerCase() == 'true';
            _buildTimeOverrides[key] = value;
          }
        }
      }
    } catch (e) {
      // Ignore parsing errors and use defaults
    }
  }

  bool isEnabled(String key) {
    // Check build-time override first
    if (_buildTimeOverrides.containsKey(key)) {
      return _buildTimeOverrides[key] as bool;
    }

    // Fall back to flag configuration
    final flag = state[key];
    return flag?.enabled ?? false;
  }

  void setFlag(String key, bool enabled, {String? description}) {
    final newFlag = FeatureFlag(
      key: key,
      enabled: enabled,
      description: description,
    );

    state = {...state, key: newFlag};
  }

  FeatureFlag? getFlag(String key) {
    return state[key];
  }

  Map<String, FeatureFlag> getAllFlags() {
    return Map.unmodifiable(state);
  }

  Map<String, dynamic> getBuildTimeOverrides() {
    return Map.unmodifiable(_buildTimeOverrides);
  }
}

final featureFlagServiceProvider =
    NotifierProvider<FeatureFlagService, Map<String, FeatureFlag>>(() {
      return FeatureFlagService();
    });

final featureFlagProvider = Provider.family<bool, String>((ref, key) {
  ref.watch(featureFlagServiceProvider);
  final service = ref.read(featureFlagServiceProvider.notifier);
  return service.isEnabled(key);
});
