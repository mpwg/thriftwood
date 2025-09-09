// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_flag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FeatureFlag _$FeatureFlagFromJson(Map<String, dynamic> json) {
  return _FeatureFlag.fromJson(json);
}

/// @nodoc
mixin _$FeatureFlag {
  String get key => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get environmentOverride => throw _privateConstructorUsedError;

  /// Serializes this FeatureFlag to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeatureFlag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeatureFlagCopyWith<FeatureFlag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureFlagCopyWith<$Res> {
  factory $FeatureFlagCopyWith(
    FeatureFlag value,
    $Res Function(FeatureFlag) then,
  ) = _$FeatureFlagCopyWithImpl<$Res, FeatureFlag>;
  @useResult
  $Res call({
    String key,
    bool enabled,
    String? description,
    String? environmentOverride,
  });
}

/// @nodoc
class _$FeatureFlagCopyWithImpl<$Res, $Val extends FeatureFlag>
    implements $FeatureFlagCopyWith<$Res> {
  _$FeatureFlagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeatureFlag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? enabled = null,
    Object? description = freezed,
    Object? environmentOverride = freezed,
  }) {
    return _then(
      _value.copyWith(
            key: null == key
                ? _value.key
                : key // ignore: cast_nullable_to_non_nullable
                      as String,
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            environmentOverride: freezed == environmentOverride
                ? _value.environmentOverride
                : environmentOverride // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FeatureFlagImplCopyWith<$Res>
    implements $FeatureFlagCopyWith<$Res> {
  factory _$$FeatureFlagImplCopyWith(
    _$FeatureFlagImpl value,
    $Res Function(_$FeatureFlagImpl) then,
  ) = __$$FeatureFlagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String key,
    bool enabled,
    String? description,
    String? environmentOverride,
  });
}

/// @nodoc
class __$$FeatureFlagImplCopyWithImpl<$Res>
    extends _$FeatureFlagCopyWithImpl<$Res, _$FeatureFlagImpl>
    implements _$$FeatureFlagImplCopyWith<$Res> {
  __$$FeatureFlagImplCopyWithImpl(
    _$FeatureFlagImpl _value,
    $Res Function(_$FeatureFlagImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeatureFlag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? enabled = null,
    Object? description = freezed,
    Object? environmentOverride = freezed,
  }) {
    return _then(
      _$FeatureFlagImpl(
        key: null == key
            ? _value.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        environmentOverride: freezed == environmentOverride
            ? _value.environmentOverride
            : environmentOverride // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureFlagImpl implements _FeatureFlag {
  const _$FeatureFlagImpl({
    required this.key,
    required this.enabled,
    this.description,
    this.environmentOverride,
  });

  factory _$FeatureFlagImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureFlagImplFromJson(json);

  @override
  final String key;
  @override
  final bool enabled;
  @override
  final String? description;
  @override
  final String? environmentOverride;

  @override
  String toString() {
    return 'FeatureFlag(key: $key, enabled: $enabled, description: $description, environmentOverride: $environmentOverride)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureFlagImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.environmentOverride, environmentOverride) ||
                other.environmentOverride == environmentOverride));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, key, enabled, description, environmentOverride);

  /// Create a copy of FeatureFlag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureFlagImplCopyWith<_$FeatureFlagImpl> get copyWith =>
      __$$FeatureFlagImplCopyWithImpl<_$FeatureFlagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureFlagImplToJson(this);
  }
}

abstract class _FeatureFlag implements FeatureFlag {
  const factory _FeatureFlag({
    required final String key,
    required final bool enabled,
    final String? description,
    final String? environmentOverride,
  }) = _$FeatureFlagImpl;

  factory _FeatureFlag.fromJson(Map<String, dynamic> json) =
      _$FeatureFlagImpl.fromJson;

  @override
  String get key;
  @override
  bool get enabled;
  @override
  String? get description;
  @override
  String? get environmentOverride;

  /// Create a copy of FeatureFlag
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeatureFlagImplCopyWith<_$FeatureFlagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeatureFlagConfig _$FeatureFlagConfigFromJson(Map<String, dynamic> json) {
  return _FeatureFlagConfig.fromJson(json);
}

/// @nodoc
mixin _$FeatureFlagConfig {
  Map<String, FeatureFlag> get flags => throw _privateConstructorUsedError;
  Map<String, dynamic> get buildTimeOverrides =>
      throw _privateConstructorUsedError;

  /// Serializes this FeatureFlagConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeatureFlagConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeatureFlagConfigCopyWith<FeatureFlagConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureFlagConfigCopyWith<$Res> {
  factory $FeatureFlagConfigCopyWith(
    FeatureFlagConfig value,
    $Res Function(FeatureFlagConfig) then,
  ) = _$FeatureFlagConfigCopyWithImpl<$Res, FeatureFlagConfig>;
  @useResult
  $Res call({
    Map<String, FeatureFlag> flags,
    Map<String, dynamic> buildTimeOverrides,
  });
}

/// @nodoc
class _$FeatureFlagConfigCopyWithImpl<$Res, $Val extends FeatureFlagConfig>
    implements $FeatureFlagConfigCopyWith<$Res> {
  _$FeatureFlagConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeatureFlagConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? flags = null, Object? buildTimeOverrides = null}) {
    return _then(
      _value.copyWith(
            flags: null == flags
                ? _value.flags
                : flags // ignore: cast_nullable_to_non_nullable
                      as Map<String, FeatureFlag>,
            buildTimeOverrides: null == buildTimeOverrides
                ? _value.buildTimeOverrides
                : buildTimeOverrides // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FeatureFlagConfigImplCopyWith<$Res>
    implements $FeatureFlagConfigCopyWith<$Res> {
  factory _$$FeatureFlagConfigImplCopyWith(
    _$FeatureFlagConfigImpl value,
    $Res Function(_$FeatureFlagConfigImpl) then,
  ) = __$$FeatureFlagConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<String, FeatureFlag> flags,
    Map<String, dynamic> buildTimeOverrides,
  });
}

/// @nodoc
class __$$FeatureFlagConfigImplCopyWithImpl<$Res>
    extends _$FeatureFlagConfigCopyWithImpl<$Res, _$FeatureFlagConfigImpl>
    implements _$$FeatureFlagConfigImplCopyWith<$Res> {
  __$$FeatureFlagConfigImplCopyWithImpl(
    _$FeatureFlagConfigImpl _value,
    $Res Function(_$FeatureFlagConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeatureFlagConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? flags = null, Object? buildTimeOverrides = null}) {
    return _then(
      _$FeatureFlagConfigImpl(
        flags: null == flags
            ? _value._flags
            : flags // ignore: cast_nullable_to_non_nullable
                  as Map<String, FeatureFlag>,
        buildTimeOverrides: null == buildTimeOverrides
            ? _value._buildTimeOverrides
            : buildTimeOverrides // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureFlagConfigImpl implements _FeatureFlagConfig {
  const _$FeatureFlagConfigImpl({
    final Map<String, FeatureFlag> flags = const {},
    final Map<String, dynamic> buildTimeOverrides = const {},
  }) : _flags = flags,
       _buildTimeOverrides = buildTimeOverrides;

  factory _$FeatureFlagConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureFlagConfigImplFromJson(json);

  final Map<String, FeatureFlag> _flags;
  @override
  @JsonKey()
  Map<String, FeatureFlag> get flags {
    if (_flags is EqualUnmodifiableMapView) return _flags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_flags);
  }

  final Map<String, dynamic> _buildTimeOverrides;
  @override
  @JsonKey()
  Map<String, dynamic> get buildTimeOverrides {
    if (_buildTimeOverrides is EqualUnmodifiableMapView)
      return _buildTimeOverrides;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_buildTimeOverrides);
  }

  @override
  String toString() {
    return 'FeatureFlagConfig(flags: $flags, buildTimeOverrides: $buildTimeOverrides)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureFlagConfigImpl &&
            const DeepCollectionEquality().equals(other._flags, _flags) &&
            const DeepCollectionEquality().equals(
              other._buildTimeOverrides,
              _buildTimeOverrides,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_flags),
    const DeepCollectionEquality().hash(_buildTimeOverrides),
  );

  /// Create a copy of FeatureFlagConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureFlagConfigImplCopyWith<_$FeatureFlagConfigImpl> get copyWith =>
      __$$FeatureFlagConfigImplCopyWithImpl<_$FeatureFlagConfigImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureFlagConfigImplToJson(this);
  }
}

abstract class _FeatureFlagConfig implements FeatureFlagConfig {
  const factory _FeatureFlagConfig({
    final Map<String, FeatureFlag> flags,
    final Map<String, dynamic> buildTimeOverrides,
  }) = _$FeatureFlagConfigImpl;

  factory _FeatureFlagConfig.fromJson(Map<String, dynamic> json) =
      _$FeatureFlagConfigImpl.fromJson;

  @override
  Map<String, FeatureFlag> get flags;
  @override
  Map<String, dynamic> get buildTimeOverrides;

  /// Create a copy of FeatureFlagConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeatureFlagConfigImplCopyWith<_$FeatureFlagConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
