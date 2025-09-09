import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_flag.freezed.dart';
part 'feature_flag.g.dart';

@freezed
class FeatureFlag with _$FeatureFlag {
  const factory FeatureFlag({
    required String key,
    required bool enabled,
    String? description,
    String? environmentOverride,
  }) = _FeatureFlag;

  factory FeatureFlag.fromJson(Map<String, dynamic> json) => _$FeatureFlagFromJson(json);
}

@freezed
class FeatureFlagConfig with _$FeatureFlagConfig {
  const factory FeatureFlagConfig({
    @Default({}) Map<String, FeatureFlag> flags,
    @Default({}) Map<String, dynamic> buildTimeOverrides,
  }) = _FeatureFlagConfig;

  factory FeatureFlagConfig.fromJson(Map<String, dynamic> json) => _$FeatureFlagConfigFromJson(json);
}