// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_flag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureFlagImpl _$$FeatureFlagImplFromJson(Map<String, dynamic> json) =>
    _$FeatureFlagImpl(
      key: json['key'] as String,
      enabled: json['enabled'] as bool,
      description: json['description'] as String?,
      environmentOverride: json['environmentOverride'] as String?,
    );

Map<String, dynamic> _$$FeatureFlagImplToJson(_$FeatureFlagImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'enabled': instance.enabled,
      'description': instance.description,
      'environmentOverride': instance.environmentOverride,
    };

_$FeatureFlagConfigImpl _$$FeatureFlagConfigImplFromJson(
  Map<String, dynamic> json,
) => _$FeatureFlagConfigImpl(
  flags:
      (json['flags'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, FeatureFlag.fromJson(e as Map<String, dynamic>)),
      ) ??
      const {},
  buildTimeOverrides:
      json['buildTimeOverrides'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$$FeatureFlagConfigImplToJson(
  _$FeatureFlagConfigImpl instance,
) => <String, dynamic>{
  'flags': instance.flags,
  'buildTimeOverrides': instance.buildTimeOverrides,
};
