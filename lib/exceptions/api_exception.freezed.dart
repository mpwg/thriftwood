// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ApiException {
  String get message => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    network,
    required TResult Function(
      String message,
      String? details,
      int? timeoutDuration,
    )
    timeout,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    server,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    client,
    required TResult Function(String message, String? details, String? endpoint)
    authentication,
    required TResult Function(String message, String? details, String? endpoint)
    authorization,
    required TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )
    validation,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    serialization,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, Object? originalError)?
    network,
    TResult? Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult? Function(String message, String? details, String? endpoint)?
    authentication,
    TResult? Function(String message, String? details, String? endpoint)?
    authorization,
    TResult? Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult? Function(String message, String? details, Object? originalError)?
    serialization,
    TResult? Function(String message, String? details, Object? originalError)?
    unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, Object? originalError)?
    network,
    TResult Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult Function(String message, String? details, String? endpoint)?
    authentication,
    TResult Function(String message, String? details, String? endpoint)?
    authorization,
    TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult Function(String message, String? details, Object? originalError)?
    serialization,
    TResult Function(String message, String? details, Object? originalError)?
    unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(ServerException value) server,
    required TResult Function(ClientException value) client,
    required TResult Function(AuthenticationException value) authentication,
    required TResult Function(AuthorizationException value) authorization,
    required TResult Function(ValidationException value) validation,
    required TResult Function(SerializationException value) serialization,
    required TResult Function(UnknownException value) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(ServerException value)? server,
    TResult? Function(ClientException value)? client,
    TResult? Function(AuthenticationException value)? authentication,
    TResult? Function(AuthorizationException value)? authorization,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(SerializationException value)? serialization,
    TResult? Function(UnknownException value)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(ServerException value)? server,
    TResult Function(ClientException value)? client,
    TResult Function(AuthenticationException value)? authentication,
    TResult Function(AuthorizationException value)? authorization,
    TResult Function(ValidationException value)? validation,
    TResult Function(SerializationException value)? serialization,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiExceptionCopyWith<ApiException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiExceptionCopyWith<$Res> {
  factory $ApiExceptionCopyWith(
    ApiException value,
    $Res Function(ApiException) then,
  ) = _$ApiExceptionCopyWithImpl<$Res, ApiException>;
  @useResult
  $Res call({String message, String? details});
}

/// @nodoc
class _$ApiExceptionCopyWithImpl<$Res, $Val extends ApiException>
    implements $ApiExceptionCopyWith<$Res> {
  _$ApiExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? details = freezed}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            details: freezed == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NetworkExceptionImplCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$NetworkExceptionImplCopyWith(
    _$NetworkExceptionImpl value,
    $Res Function(_$NetworkExceptionImpl) then,
  ) = __$$NetworkExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details, Object? originalError});
}

/// @nodoc
class __$$NetworkExceptionImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$NetworkExceptionImpl>
    implements _$$NetworkExceptionImplCopyWith<$Res> {
  __$$NetworkExceptionImplCopyWithImpl(
    _$NetworkExceptionImpl _value,
    $Res Function(_$NetworkExceptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
    Object? originalError = freezed,
  }) {
    return _then(
      _$NetworkExceptionImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
        originalError: freezed == originalError
            ? _value.originalError
            : originalError,
      ),
    );
  }
}

/// @nodoc

class _$NetworkExceptionImpl implements NetworkException {
  const _$NetworkExceptionImpl({
    required this.message,
    this.details,
    this.originalError,
  });

  @override
  final String message;
  @override
  final String? details;
  @override
  final Object? originalError;

  @override
  String toString() {
    return 'ApiException.network(message: $message, details: $details, originalError: $originalError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            const DeepCollectionEquality().equals(
              other.originalError,
              originalError,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    details,
    const DeepCollectionEquality().hash(originalError),
  );

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkExceptionImplCopyWith<_$NetworkExceptionImpl> get copyWith =>
      __$$NetworkExceptionImplCopyWithImpl<_$NetworkExceptionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    network,
    required TResult Function(
      String message,
      String? details,
      int? timeoutDuration,
    )
    timeout,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    server,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    client,
    required TResult Function(String message, String? details, String? endpoint)
    authentication,
    required TResult Function(String message, String? details, String? endpoint)
    authorization,
    required TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )
    validation,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    serialization,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    unknown,
  }) {
    return network(message, details, originalError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, Object? originalError)?
    network,
    TResult? Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult? Function(String message, String? details, String? endpoint)?
    authentication,
    TResult? Function(String message, String? details, String? endpoint)?
    authorization,
    TResult? Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult? Function(String message, String? details, Object? originalError)?
    serialization,
    TResult? Function(String message, String? details, Object? originalError)?
    unknown,
  }) {
    return network?.call(message, details, originalError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, Object? originalError)?
    network,
    TResult Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult Function(String message, String? details, String? endpoint)?
    authentication,
    TResult Function(String message, String? details, String? endpoint)?
    authorization,
    TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult Function(String message, String? details, Object? originalError)?
    serialization,
    TResult Function(String message, String? details, Object? originalError)?
    unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message, details, originalError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(ServerException value) server,
    required TResult Function(ClientException value) client,
    required TResult Function(AuthenticationException value) authentication,
    required TResult Function(AuthorizationException value) authorization,
    required TResult Function(ValidationException value) validation,
    required TResult Function(SerializationException value) serialization,
    required TResult Function(UnknownException value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(ServerException value)? server,
    TResult? Function(ClientException value)? client,
    TResult? Function(AuthenticationException value)? authentication,
    TResult? Function(AuthorizationException value)? authorization,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(SerializationException value)? serialization,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(ServerException value)? server,
    TResult Function(ClientException value)? client,
    TResult Function(AuthenticationException value)? authentication,
    TResult Function(AuthorizationException value)? authorization,
    TResult Function(ValidationException value)? validation,
    TResult Function(SerializationException value)? serialization,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkException implements ApiException {
  const factory NetworkException({
    required final String message,
    final String? details,
    final Object? originalError,
  }) = _$NetworkExceptionImpl;

  @override
  String get message;
  @override
  String? get details;
  Object? get originalError;

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkExceptionImplCopyWith<_$NetworkExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeoutExceptionImplCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$TimeoutExceptionImplCopyWith(
    _$TimeoutExceptionImpl value,
    $Res Function(_$TimeoutExceptionImpl) then,
  ) = __$$TimeoutExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details, int? timeoutDuration});
}

/// @nodoc
class __$$TimeoutExceptionImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$TimeoutExceptionImpl>
    implements _$$TimeoutExceptionImplCopyWith<$Res> {
  __$$TimeoutExceptionImplCopyWithImpl(
    _$TimeoutExceptionImpl _value,
    $Res Function(_$TimeoutExceptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
    Object? timeoutDuration = freezed,
  }) {
    return _then(
      _$TimeoutExceptionImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
        timeoutDuration: freezed == timeoutDuration
            ? _value.timeoutDuration
            : timeoutDuration // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$TimeoutExceptionImpl implements TimeoutException {
  const _$TimeoutExceptionImpl({
    required this.message,
    this.details,
    this.timeoutDuration,
  });

  @override
  final String message;
  @override
  final String? details;
  @override
  final int? timeoutDuration;

  @override
  String toString() {
    return 'ApiException.timeout(message: $message, details: $details, timeoutDuration: $timeoutDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeoutExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.timeoutDuration, timeoutDuration) ||
                other.timeoutDuration == timeoutDuration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, details, timeoutDuration);

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeoutExceptionImplCopyWith<_$TimeoutExceptionImpl> get copyWith =>
      __$$TimeoutExceptionImplCopyWithImpl<_$TimeoutExceptionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    network,
    required TResult Function(
      String message,
      String? details,
      int? timeoutDuration,
    )
    timeout,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    server,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    client,
    required TResult Function(String message, String? details, String? endpoint)
    authentication,
    required TResult Function(String message, String? details, String? endpoint)
    authorization,
    required TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )
    validation,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    serialization,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    unknown,
  }) {
    return timeout(message, details, timeoutDuration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, Object? originalError)?
    network,
    TResult? Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult? Function(String message, String? details, String? endpoint)?
    authentication,
    TResult? Function(String message, String? details, String? endpoint)?
    authorization,
    TResult? Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult? Function(String message, String? details, Object? originalError)?
    serialization,
    TResult? Function(String message, String? details, Object? originalError)?
    unknown,
  }) {
    return timeout?.call(message, details, timeoutDuration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, Object? originalError)?
    network,
    TResult Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult Function(String message, String? details, String? endpoint)?
    authentication,
    TResult Function(String message, String? details, String? endpoint)?
    authorization,
    TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult Function(String message, String? details, Object? originalError)?
    serialization,
    TResult Function(String message, String? details, Object? originalError)?
    unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(message, details, timeoutDuration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(ServerException value) server,
    required TResult Function(ClientException value) client,
    required TResult Function(AuthenticationException value) authentication,
    required TResult Function(AuthorizationException value) authorization,
    required TResult Function(ValidationException value) validation,
    required TResult Function(SerializationException value) serialization,
    required TResult Function(UnknownException value) unknown,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(ServerException value)? server,
    TResult? Function(ClientException value)? client,
    TResult? Function(AuthenticationException value)? authentication,
    TResult? Function(AuthorizationException value)? authorization,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(SerializationException value)? serialization,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(ServerException value)? server,
    TResult Function(ClientException value)? client,
    TResult Function(AuthenticationException value)? authentication,
    TResult Function(AuthorizationException value)? authorization,
    TResult Function(ValidationException value)? validation,
    TResult Function(SerializationException value)? serialization,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class TimeoutException implements ApiException {
  const factory TimeoutException({
    required final String message,
    final String? details,
    final int? timeoutDuration,
  }) = _$TimeoutExceptionImpl;

  @override
  String get message;
  @override
  String? get details;
  int? get timeoutDuration;

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeoutExceptionImplCopyWith<_$TimeoutExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerExceptionImplCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$ServerExceptionImplCopyWith(
    _$ServerExceptionImpl value,
    $Res Function(_$ServerExceptionImpl) then,
  ) = __$$ServerExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    int statusCode,
    String? details,
    String? endpoint,
    Map<String, dynamic>? responseData,
  });
}

/// @nodoc
class __$$ServerExceptionImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$ServerExceptionImpl>
    implements _$$ServerExceptionImplCopyWith<$Res> {
  __$$ServerExceptionImplCopyWithImpl(
    _$ServerExceptionImpl _value,
    $Res Function(_$ServerExceptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
    Object? details = freezed,
    Object? endpoint = freezed,
    Object? responseData = freezed,
  }) {
    return _then(
      _$ServerExceptionImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        statusCode: null == statusCode
            ? _value.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
        endpoint: freezed == endpoint
            ? _value.endpoint
            : endpoint // ignore: cast_nullable_to_non_nullable
                  as String?,
        responseData: freezed == responseData
            ? _value._responseData
            : responseData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$ServerExceptionImpl implements ServerException {
  const _$ServerExceptionImpl({
    required this.message,
    required this.statusCode,
    this.details,
    this.endpoint,
    final Map<String, dynamic>? responseData,
  }) : _responseData = responseData;

  @override
  final String message;
  @override
  final int statusCode;
  @override
  final String? details;
  @override
  final String? endpoint;
  final Map<String, dynamic>? _responseData;
  @override
  Map<String, dynamic>? get responseData {
    final value = _responseData;
    if (value == null) return null;
    if (_responseData is EqualUnmodifiableMapView) return _responseData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ApiException.server(message: $message, statusCode: $statusCode, details: $details, endpoint: $endpoint, responseData: $responseData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            const DeepCollectionEquality().equals(
              other._responseData,
              _responseData,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    statusCode,
    details,
    endpoint,
    const DeepCollectionEquality().hash(_responseData),
  );

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      __$$ServerExceptionImplCopyWithImpl<_$ServerExceptionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    network,
    required TResult Function(
      String message,
      String? details,
      int? timeoutDuration,
    )
    timeout,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    server,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    client,
    required TResult Function(String message, String? details, String? endpoint)
    authentication,
    required TResult Function(String message, String? details, String? endpoint)
    authorization,
    required TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )
    validation,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    serialization,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    unknown,
  }) {
    return server(message, statusCode, details, endpoint, responseData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, Object? originalError)?
    network,
    TResult? Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult? Function(String message, String? details, String? endpoint)?
    authentication,
    TResult? Function(String message, String? details, String? endpoint)?
    authorization,
    TResult? Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult? Function(String message, String? details, Object? originalError)?
    serialization,
    TResult? Function(String message, String? details, Object? originalError)?
    unknown,
  }) {
    return server?.call(message, statusCode, details, endpoint, responseData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, Object? originalError)?
    network,
    TResult Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult Function(String message, String? details, String? endpoint)?
    authentication,
    TResult Function(String message, String? details, String? endpoint)?
    authorization,
    TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult Function(String message, String? details, Object? originalError)?
    serialization,
    TResult Function(String message, String? details, Object? originalError)?
    unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message, statusCode, details, endpoint, responseData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(ServerException value) server,
    required TResult Function(ClientException value) client,
    required TResult Function(AuthenticationException value) authentication,
    required TResult Function(AuthorizationException value) authorization,
    required TResult Function(ValidationException value) validation,
    required TResult Function(SerializationException value) serialization,
    required TResult Function(UnknownException value) unknown,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(ServerException value)? server,
    TResult? Function(ClientException value)? client,
    TResult? Function(AuthenticationException value)? authentication,
    TResult? Function(AuthorizationException value)? authorization,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(SerializationException value)? serialization,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(ServerException value)? server,
    TResult Function(ClientException value)? client,
    TResult Function(AuthenticationException value)? authentication,
    TResult Function(AuthorizationException value)? authorization,
    TResult Function(ValidationException value)? validation,
    TResult Function(SerializationException value)? serialization,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerException implements ApiException {
  const factory ServerException({
    required final String message,
    required final int statusCode,
    final String? details,
    final String? endpoint,
    final Map<String, dynamic>? responseData,
  }) = _$ServerExceptionImpl;

  @override
  String get message;
  int get statusCode;
  @override
  String? get details;
  String? get endpoint;
  Map<String, dynamic>? get responseData;

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClientExceptionImplCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$ClientExceptionImplCopyWith(
    _$ClientExceptionImpl value,
    $Res Function(_$ClientExceptionImpl) then,
  ) = __$$ClientExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    int statusCode,
    String? details,
    String? endpoint,
    Map<String, dynamic>? responseData,
  });
}

/// @nodoc
class __$$ClientExceptionImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$ClientExceptionImpl>
    implements _$$ClientExceptionImplCopyWith<$Res> {
  __$$ClientExceptionImplCopyWithImpl(
    _$ClientExceptionImpl _value,
    $Res Function(_$ClientExceptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
    Object? details = freezed,
    Object? endpoint = freezed,
    Object? responseData = freezed,
  }) {
    return _then(
      _$ClientExceptionImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        statusCode: null == statusCode
            ? _value.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
        endpoint: freezed == endpoint
            ? _value.endpoint
            : endpoint // ignore: cast_nullable_to_non_nullable
                  as String?,
        responseData: freezed == responseData
            ? _value._responseData
            : responseData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc

class _$ClientExceptionImpl implements ClientException {
  const _$ClientExceptionImpl({
    required this.message,
    required this.statusCode,
    this.details,
    this.endpoint,
    final Map<String, dynamic>? responseData,
  }) : _responseData = responseData;

  @override
  final String message;
  @override
  final int statusCode;
  @override
  final String? details;
  @override
  final String? endpoint;
  final Map<String, dynamic>? _responseData;
  @override
  Map<String, dynamic>? get responseData {
    final value = _responseData;
    if (value == null) return null;
    if (_responseData is EqualUnmodifiableMapView) return _responseData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ApiException.client(message: $message, statusCode: $statusCode, details: $details, endpoint: $endpoint, responseData: $responseData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            const DeepCollectionEquality().equals(
              other._responseData,
              _responseData,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    statusCode,
    details,
    endpoint,
    const DeepCollectionEquality().hash(_responseData),
  );

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientExceptionImplCopyWith<_$ClientExceptionImpl> get copyWith =>
      __$$ClientExceptionImplCopyWithImpl<_$ClientExceptionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    network,
    required TResult Function(
      String message,
      String? details,
      int? timeoutDuration,
    )
    timeout,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    server,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    client,
    required TResult Function(String message, String? details, String? endpoint)
    authentication,
    required TResult Function(String message, String? details, String? endpoint)
    authorization,
    required TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )
    validation,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    serialization,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    unknown,
  }) {
    return client(message, statusCode, details, endpoint, responseData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, Object? originalError)?
    network,
    TResult? Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult? Function(String message, String? details, String? endpoint)?
    authentication,
    TResult? Function(String message, String? details, String? endpoint)?
    authorization,
    TResult? Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult? Function(String message, String? details, Object? originalError)?
    serialization,
    TResult? Function(String message, String? details, Object? originalError)?
    unknown,
  }) {
    return client?.call(message, statusCode, details, endpoint, responseData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, Object? originalError)?
    network,
    TResult Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult Function(String message, String? details, String? endpoint)?
    authentication,
    TResult Function(String message, String? details, String? endpoint)?
    authorization,
    TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult Function(String message, String? details, Object? originalError)?
    serialization,
    TResult Function(String message, String? details, Object? originalError)?
    unknown,
    required TResult orElse(),
  }) {
    if (client != null) {
      return client(message, statusCode, details, endpoint, responseData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(ServerException value) server,
    required TResult Function(ClientException value) client,
    required TResult Function(AuthenticationException value) authentication,
    required TResult Function(AuthorizationException value) authorization,
    required TResult Function(ValidationException value) validation,
    required TResult Function(SerializationException value) serialization,
    required TResult Function(UnknownException value) unknown,
  }) {
    return client(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(ServerException value)? server,
    TResult? Function(ClientException value)? client,
    TResult? Function(AuthenticationException value)? authentication,
    TResult? Function(AuthorizationException value)? authorization,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(SerializationException value)? serialization,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return client?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(ServerException value)? server,
    TResult Function(ClientException value)? client,
    TResult Function(AuthenticationException value)? authentication,
    TResult Function(AuthorizationException value)? authorization,
    TResult Function(ValidationException value)? validation,
    TResult Function(SerializationException value)? serialization,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (client != null) {
      return client(this);
    }
    return orElse();
  }
}

abstract class ClientException implements ApiException {
  const factory ClientException({
    required final String message,
    required final int statusCode,
    final String? details,
    final String? endpoint,
    final Map<String, dynamic>? responseData,
  }) = _$ClientExceptionImpl;

  @override
  String get message;
  int get statusCode;
  @override
  String? get details;
  String? get endpoint;
  Map<String, dynamic>? get responseData;

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientExceptionImplCopyWith<_$ClientExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticationExceptionImplCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$AuthenticationExceptionImplCopyWith(
    _$AuthenticationExceptionImpl value,
    $Res Function(_$AuthenticationExceptionImpl) then,
  ) = __$$AuthenticationExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details, String? endpoint});
}

/// @nodoc
class __$$AuthenticationExceptionImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$AuthenticationExceptionImpl>
    implements _$$AuthenticationExceptionImplCopyWith<$Res> {
  __$$AuthenticationExceptionImplCopyWithImpl(
    _$AuthenticationExceptionImpl _value,
    $Res Function(_$AuthenticationExceptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
    Object? endpoint = freezed,
  }) {
    return _then(
      _$AuthenticationExceptionImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
        endpoint: freezed == endpoint
            ? _value.endpoint
            : endpoint // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AuthenticationExceptionImpl implements AuthenticationException {
  const _$AuthenticationExceptionImpl({
    required this.message,
    this.details,
    this.endpoint,
  });

  @override
  final String message;
  @override
  final String? details;
  @override
  final String? endpoint;

  @override
  String toString() {
    return 'ApiException.authentication(message: $message, details: $details, endpoint: $endpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details, endpoint);

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationExceptionImplCopyWith<_$AuthenticationExceptionImpl>
  get copyWith =>
      __$$AuthenticationExceptionImplCopyWithImpl<
        _$AuthenticationExceptionImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    network,
    required TResult Function(
      String message,
      String? details,
      int? timeoutDuration,
    )
    timeout,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    server,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    client,
    required TResult Function(String message, String? details, String? endpoint)
    authentication,
    required TResult Function(String message, String? details, String? endpoint)
    authorization,
    required TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )
    validation,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    serialization,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    unknown,
  }) {
    return authentication(message, details, endpoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, Object? originalError)?
    network,
    TResult? Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult? Function(String message, String? details, String? endpoint)?
    authentication,
    TResult? Function(String message, String? details, String? endpoint)?
    authorization,
    TResult? Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult? Function(String message, String? details, Object? originalError)?
    serialization,
    TResult? Function(String message, String? details, Object? originalError)?
    unknown,
  }) {
    return authentication?.call(message, details, endpoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, Object? originalError)?
    network,
    TResult Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult Function(String message, String? details, String? endpoint)?
    authentication,
    TResult Function(String message, String? details, String? endpoint)?
    authorization,
    TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult Function(String message, String? details, Object? originalError)?
    serialization,
    TResult Function(String message, String? details, Object? originalError)?
    unknown,
    required TResult orElse(),
  }) {
    if (authentication != null) {
      return authentication(message, details, endpoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(ServerException value) server,
    required TResult Function(ClientException value) client,
    required TResult Function(AuthenticationException value) authentication,
    required TResult Function(AuthorizationException value) authorization,
    required TResult Function(ValidationException value) validation,
    required TResult Function(SerializationException value) serialization,
    required TResult Function(UnknownException value) unknown,
  }) {
    return authentication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(ServerException value)? server,
    TResult? Function(ClientException value)? client,
    TResult? Function(AuthenticationException value)? authentication,
    TResult? Function(AuthorizationException value)? authorization,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(SerializationException value)? serialization,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return authentication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(ServerException value)? server,
    TResult Function(ClientException value)? client,
    TResult Function(AuthenticationException value)? authentication,
    TResult Function(AuthorizationException value)? authorization,
    TResult Function(ValidationException value)? validation,
    TResult Function(SerializationException value)? serialization,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (authentication != null) {
      return authentication(this);
    }
    return orElse();
  }
}

abstract class AuthenticationException implements ApiException {
  const factory AuthenticationException({
    required final String message,
    final String? details,
    final String? endpoint,
  }) = _$AuthenticationExceptionImpl;

  @override
  String get message;
  @override
  String? get details;
  String? get endpoint;

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationExceptionImplCopyWith<_$AuthenticationExceptionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthorizationExceptionImplCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$AuthorizationExceptionImplCopyWith(
    _$AuthorizationExceptionImpl value,
    $Res Function(_$AuthorizationExceptionImpl) then,
  ) = __$$AuthorizationExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details, String? endpoint});
}

/// @nodoc
class __$$AuthorizationExceptionImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$AuthorizationExceptionImpl>
    implements _$$AuthorizationExceptionImplCopyWith<$Res> {
  __$$AuthorizationExceptionImplCopyWithImpl(
    _$AuthorizationExceptionImpl _value,
    $Res Function(_$AuthorizationExceptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
    Object? endpoint = freezed,
  }) {
    return _then(
      _$AuthorizationExceptionImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
        endpoint: freezed == endpoint
            ? _value.endpoint
            : endpoint // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AuthorizationExceptionImpl implements AuthorizationException {
  const _$AuthorizationExceptionImpl({
    required this.message,
    this.details,
    this.endpoint,
  });

  @override
  final String message;
  @override
  final String? details;
  @override
  final String? endpoint;

  @override
  String toString() {
    return 'ApiException.authorization(message: $message, details: $details, endpoint: $endpoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizationExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, details, endpoint);

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizationExceptionImplCopyWith<_$AuthorizationExceptionImpl>
  get copyWith =>
      __$$AuthorizationExceptionImplCopyWithImpl<_$AuthorizationExceptionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    network,
    required TResult Function(
      String message,
      String? details,
      int? timeoutDuration,
    )
    timeout,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    server,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    client,
    required TResult Function(String message, String? details, String? endpoint)
    authentication,
    required TResult Function(String message, String? details, String? endpoint)
    authorization,
    required TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )
    validation,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    serialization,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    unknown,
  }) {
    return authorization(message, details, endpoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, Object? originalError)?
    network,
    TResult? Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult? Function(String message, String? details, String? endpoint)?
    authentication,
    TResult? Function(String message, String? details, String? endpoint)?
    authorization,
    TResult? Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult? Function(String message, String? details, Object? originalError)?
    serialization,
    TResult? Function(String message, String? details, Object? originalError)?
    unknown,
  }) {
    return authorization?.call(message, details, endpoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, Object? originalError)?
    network,
    TResult Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult Function(String message, String? details, String? endpoint)?
    authentication,
    TResult Function(String message, String? details, String? endpoint)?
    authorization,
    TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult Function(String message, String? details, Object? originalError)?
    serialization,
    TResult Function(String message, String? details, Object? originalError)?
    unknown,
    required TResult orElse(),
  }) {
    if (authorization != null) {
      return authorization(message, details, endpoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(ServerException value) server,
    required TResult Function(ClientException value) client,
    required TResult Function(AuthenticationException value) authentication,
    required TResult Function(AuthorizationException value) authorization,
    required TResult Function(ValidationException value) validation,
    required TResult Function(SerializationException value) serialization,
    required TResult Function(UnknownException value) unknown,
  }) {
    return authorization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(ServerException value)? server,
    TResult? Function(ClientException value)? client,
    TResult? Function(AuthenticationException value)? authentication,
    TResult? Function(AuthorizationException value)? authorization,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(SerializationException value)? serialization,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return authorization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(ServerException value)? server,
    TResult Function(ClientException value)? client,
    TResult Function(AuthenticationException value)? authentication,
    TResult Function(AuthorizationException value)? authorization,
    TResult Function(ValidationException value)? validation,
    TResult Function(SerializationException value)? serialization,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (authorization != null) {
      return authorization(this);
    }
    return orElse();
  }
}

abstract class AuthorizationException implements ApiException {
  const factory AuthorizationException({
    required final String message,
    final String? details,
    final String? endpoint,
  }) = _$AuthorizationExceptionImpl;

  @override
  String get message;
  @override
  String? get details;
  String? get endpoint;

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorizationExceptionImplCopyWith<_$AuthorizationExceptionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationExceptionImplCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$ValidationExceptionImplCopyWith(
    _$ValidationExceptionImpl value,
    $Res Function(_$ValidationExceptionImpl) then,
  ) = __$$ValidationExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    Map<String, String>? fieldErrors,
    String? details,
  });
}

/// @nodoc
class __$$ValidationExceptionImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$ValidationExceptionImpl>
    implements _$$ValidationExceptionImplCopyWith<$Res> {
  __$$ValidationExceptionImplCopyWithImpl(
    _$ValidationExceptionImpl _value,
    $Res Function(_$ValidationExceptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? fieldErrors = freezed,
    Object? details = freezed,
  }) {
    return _then(
      _$ValidationExceptionImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        fieldErrors: freezed == fieldErrors
            ? _value._fieldErrors
            : fieldErrors // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>?,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ValidationExceptionImpl implements ValidationException {
  const _$ValidationExceptionImpl({
    required this.message,
    final Map<String, String>? fieldErrors,
    this.details,
  }) : _fieldErrors = fieldErrors;

  @override
  final String message;
  final Map<String, String>? _fieldErrors;
  @override
  Map<String, String>? get fieldErrors {
    final value = _fieldErrors;
    if (value == null) return null;
    if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? details;

  @override
  String toString() {
    return 'ApiException.validation(message: $message, fieldErrors: $fieldErrors, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._fieldErrors,
              _fieldErrors,
            ) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    const DeepCollectionEquality().hash(_fieldErrors),
    details,
  );

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationExceptionImplCopyWith<_$ValidationExceptionImpl> get copyWith =>
      __$$ValidationExceptionImplCopyWithImpl<_$ValidationExceptionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    network,
    required TResult Function(
      String message,
      String? details,
      int? timeoutDuration,
    )
    timeout,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    server,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    client,
    required TResult Function(String message, String? details, String? endpoint)
    authentication,
    required TResult Function(String message, String? details, String? endpoint)
    authorization,
    required TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )
    validation,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    serialization,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    unknown,
  }) {
    return validation(message, fieldErrors, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, Object? originalError)?
    network,
    TResult? Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult? Function(String message, String? details, String? endpoint)?
    authentication,
    TResult? Function(String message, String? details, String? endpoint)?
    authorization,
    TResult? Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult? Function(String message, String? details, Object? originalError)?
    serialization,
    TResult? Function(String message, String? details, Object? originalError)?
    unknown,
  }) {
    return validation?.call(message, fieldErrors, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, Object? originalError)?
    network,
    TResult Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult Function(String message, String? details, String? endpoint)?
    authentication,
    TResult Function(String message, String? details, String? endpoint)?
    authorization,
    TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult Function(String message, String? details, Object? originalError)?
    serialization,
    TResult Function(String message, String? details, Object? originalError)?
    unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, fieldErrors, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(ServerException value) server,
    required TResult Function(ClientException value) client,
    required TResult Function(AuthenticationException value) authentication,
    required TResult Function(AuthorizationException value) authorization,
    required TResult Function(ValidationException value) validation,
    required TResult Function(SerializationException value) serialization,
    required TResult Function(UnknownException value) unknown,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(ServerException value)? server,
    TResult? Function(ClientException value)? client,
    TResult? Function(AuthenticationException value)? authentication,
    TResult? Function(AuthorizationException value)? authorization,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(SerializationException value)? serialization,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(ServerException value)? server,
    TResult Function(ClientException value)? client,
    TResult Function(AuthenticationException value)? authentication,
    TResult Function(AuthorizationException value)? authorization,
    TResult Function(ValidationException value)? validation,
    TResult Function(SerializationException value)? serialization,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationException implements ApiException {
  const factory ValidationException({
    required final String message,
    final Map<String, String>? fieldErrors,
    final String? details,
  }) = _$ValidationExceptionImpl;

  @override
  String get message;
  Map<String, String>? get fieldErrors;
  @override
  String? get details;

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationExceptionImplCopyWith<_$ValidationExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SerializationExceptionImplCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$SerializationExceptionImplCopyWith(
    _$SerializationExceptionImpl value,
    $Res Function(_$SerializationExceptionImpl) then,
  ) = __$$SerializationExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details, Object? originalError});
}

/// @nodoc
class __$$SerializationExceptionImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$SerializationExceptionImpl>
    implements _$$SerializationExceptionImplCopyWith<$Res> {
  __$$SerializationExceptionImplCopyWithImpl(
    _$SerializationExceptionImpl _value,
    $Res Function(_$SerializationExceptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
    Object? originalError = freezed,
  }) {
    return _then(
      _$SerializationExceptionImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
        originalError: freezed == originalError
            ? _value.originalError
            : originalError,
      ),
    );
  }
}

/// @nodoc

class _$SerializationExceptionImpl implements SerializationException {
  const _$SerializationExceptionImpl({
    required this.message,
    this.details,
    this.originalError,
  });

  @override
  final String message;
  @override
  final String? details;
  @override
  final Object? originalError;

  @override
  String toString() {
    return 'ApiException.serialization(message: $message, details: $details, originalError: $originalError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SerializationExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            const DeepCollectionEquality().equals(
              other.originalError,
              originalError,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    details,
    const DeepCollectionEquality().hash(originalError),
  );

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SerializationExceptionImplCopyWith<_$SerializationExceptionImpl>
  get copyWith =>
      __$$SerializationExceptionImplCopyWithImpl<_$SerializationExceptionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    network,
    required TResult Function(
      String message,
      String? details,
      int? timeoutDuration,
    )
    timeout,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    server,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    client,
    required TResult Function(String message, String? details, String? endpoint)
    authentication,
    required TResult Function(String message, String? details, String? endpoint)
    authorization,
    required TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )
    validation,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    serialization,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    unknown,
  }) {
    return serialization(message, details, originalError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, Object? originalError)?
    network,
    TResult? Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult? Function(String message, String? details, String? endpoint)?
    authentication,
    TResult? Function(String message, String? details, String? endpoint)?
    authorization,
    TResult? Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult? Function(String message, String? details, Object? originalError)?
    serialization,
    TResult? Function(String message, String? details, Object? originalError)?
    unknown,
  }) {
    return serialization?.call(message, details, originalError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, Object? originalError)?
    network,
    TResult Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult Function(String message, String? details, String? endpoint)?
    authentication,
    TResult Function(String message, String? details, String? endpoint)?
    authorization,
    TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult Function(String message, String? details, Object? originalError)?
    serialization,
    TResult Function(String message, String? details, Object? originalError)?
    unknown,
    required TResult orElse(),
  }) {
    if (serialization != null) {
      return serialization(message, details, originalError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(ServerException value) server,
    required TResult Function(ClientException value) client,
    required TResult Function(AuthenticationException value) authentication,
    required TResult Function(AuthorizationException value) authorization,
    required TResult Function(ValidationException value) validation,
    required TResult Function(SerializationException value) serialization,
    required TResult Function(UnknownException value) unknown,
  }) {
    return serialization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(ServerException value)? server,
    TResult? Function(ClientException value)? client,
    TResult? Function(AuthenticationException value)? authentication,
    TResult? Function(AuthorizationException value)? authorization,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(SerializationException value)? serialization,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return serialization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(ServerException value)? server,
    TResult Function(ClientException value)? client,
    TResult Function(AuthenticationException value)? authentication,
    TResult Function(AuthorizationException value)? authorization,
    TResult Function(ValidationException value)? validation,
    TResult Function(SerializationException value)? serialization,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (serialization != null) {
      return serialization(this);
    }
    return orElse();
  }
}

abstract class SerializationException implements ApiException {
  const factory SerializationException({
    required final String message,
    final String? details,
    final Object? originalError,
  }) = _$SerializationExceptionImpl;

  @override
  String get message;
  @override
  String? get details;
  Object? get originalError;

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SerializationExceptionImplCopyWith<_$SerializationExceptionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownExceptionImplCopyWith<$Res>
    implements $ApiExceptionCopyWith<$Res> {
  factory _$$UnknownExceptionImplCopyWith(
    _$UnknownExceptionImpl value,
    $Res Function(_$UnknownExceptionImpl) then,
  ) = __$$UnknownExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? details, Object? originalError});
}

/// @nodoc
class __$$UnknownExceptionImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$UnknownExceptionImpl>
    implements _$$UnknownExceptionImplCopyWith<$Res> {
  __$$UnknownExceptionImplCopyWithImpl(
    _$UnknownExceptionImpl _value,
    $Res Function(_$UnknownExceptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? details = freezed,
    Object? originalError = freezed,
  }) {
    return _then(
      _$UnknownExceptionImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String?,
        originalError: freezed == originalError
            ? _value.originalError
            : originalError,
      ),
    );
  }
}

/// @nodoc

class _$UnknownExceptionImpl implements UnknownException {
  const _$UnknownExceptionImpl({
    required this.message,
    this.details,
    this.originalError,
  });

  @override
  final String message;
  @override
  final String? details;
  @override
  final Object? originalError;

  @override
  String toString() {
    return 'ApiException.unknown(message: $message, details: $details, originalError: $originalError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.details, details) || other.details == details) &&
            const DeepCollectionEquality().equals(
              other.originalError,
              originalError,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    details,
    const DeepCollectionEquality().hash(originalError),
  );

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownExceptionImplCopyWith<_$UnknownExceptionImpl> get copyWith =>
      __$$UnknownExceptionImplCopyWithImpl<_$UnknownExceptionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    network,
    required TResult Function(
      String message,
      String? details,
      int? timeoutDuration,
    )
    timeout,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    server,
    required TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )
    client,
    required TResult Function(String message, String? details, String? endpoint)
    authentication,
    required TResult Function(String message, String? details, String? endpoint)
    authorization,
    required TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )
    validation,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    serialization,
    required TResult Function(
      String message,
      String? details,
      Object? originalError,
    )
    unknown,
  }) {
    return unknown(message, details, originalError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, String? details, Object? originalError)?
    network,
    TResult? Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult? Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult? Function(String message, String? details, String? endpoint)?
    authentication,
    TResult? Function(String message, String? details, String? endpoint)?
    authorization,
    TResult? Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult? Function(String message, String? details, Object? originalError)?
    serialization,
    TResult? Function(String message, String? details, Object? originalError)?
    unknown,
  }) {
    return unknown?.call(message, details, originalError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, String? details, Object? originalError)?
    network,
    TResult Function(String message, String? details, int? timeoutDuration)?
    timeout,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    server,
    TResult Function(
      String message,
      int statusCode,
      String? details,
      String? endpoint,
      Map<String, dynamic>? responseData,
    )?
    client,
    TResult Function(String message, String? details, String? endpoint)?
    authentication,
    TResult Function(String message, String? details, String? endpoint)?
    authorization,
    TResult Function(
      String message,
      Map<String, String>? fieldErrors,
      String? details,
    )?
    validation,
    TResult Function(String message, String? details, Object? originalError)?
    serialization,
    TResult Function(String message, String? details, Object? originalError)?
    unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message, details, originalError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkException value) network,
    required TResult Function(TimeoutException value) timeout,
    required TResult Function(ServerException value) server,
    required TResult Function(ClientException value) client,
    required TResult Function(AuthenticationException value) authentication,
    required TResult Function(AuthorizationException value) authorization,
    required TResult Function(ValidationException value) validation,
    required TResult Function(SerializationException value) serialization,
    required TResult Function(UnknownException value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkException value)? network,
    TResult? Function(TimeoutException value)? timeout,
    TResult? Function(ServerException value)? server,
    TResult? Function(ClientException value)? client,
    TResult? Function(AuthenticationException value)? authentication,
    TResult? Function(AuthorizationException value)? authorization,
    TResult? Function(ValidationException value)? validation,
    TResult? Function(SerializationException value)? serialization,
    TResult? Function(UnknownException value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkException value)? network,
    TResult Function(TimeoutException value)? timeout,
    TResult Function(ServerException value)? server,
    TResult Function(ClientException value)? client,
    TResult Function(AuthenticationException value)? authentication,
    TResult Function(AuthorizationException value)? authorization,
    TResult Function(ValidationException value)? validation,
    TResult Function(SerializationException value)? serialization,
    TResult Function(UnknownException value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownException implements ApiException {
  const factory UnknownException({
    required final String message,
    final String? details,
    final Object? originalError,
  }) = _$UnknownExceptionImpl;

  @override
  String get message;
  @override
  String? get details;
  Object? get originalError;

  /// Create a copy of ApiException
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownExceptionImplCopyWith<_$UnknownExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
