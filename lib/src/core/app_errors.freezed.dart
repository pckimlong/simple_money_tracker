// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_errors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) noRecord,
    required TResult Function(String? message) exeption,
    required TResult Function(String? message) authExeption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? noRecord,
    TResult Function(String? message)? exeption,
    TResult Function(String? message)? authExeption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? noRecord,
    TResult Function(String? message)? exeption,
    TResult Function(String? message)? authExeption,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoRecord value) noRecord,
    required TResult Function(_Exeption value) exeption,
    required TResult Function(_AuthExeption value) authExeption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_Exeption value)? exeption,
    TResult Function(_AuthExeption value)? authExeption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_Exeption value)? exeption,
    TResult Function(_AuthExeption value)? authExeption,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_NoRecordCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$_NoRecordCopyWith(
          _$_NoRecord value, $Res Function(_$_NoRecord) then) =
      __$$_NoRecordCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_NoRecordCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$$_NoRecordCopyWith<$Res> {
  __$$_NoRecordCopyWithImpl(
      _$_NoRecord _value, $Res Function(_$_NoRecord) _then)
      : super(_value, (v) => _then(v as _$_NoRecord));

  @override
  _$_NoRecord get _value => super._value as _$_NoRecord;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_NoRecord(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_NoRecord implements _NoRecord {
  const _$_NoRecord([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.noRecord(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoRecord &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_NoRecordCopyWith<_$_NoRecord> get copyWith =>
      __$$_NoRecordCopyWithImpl<_$_NoRecord>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) noRecord,
    required TResult Function(String? message) exeption,
    required TResult Function(String? message) authExeption,
  }) {
    return noRecord(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? noRecord,
    TResult Function(String? message)? exeption,
    TResult Function(String? message)? authExeption,
  }) {
    return noRecord?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? noRecord,
    TResult Function(String? message)? exeption,
    TResult Function(String? message)? authExeption,
    required TResult orElse(),
  }) {
    if (noRecord != null) {
      return noRecord(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoRecord value) noRecord,
    required TResult Function(_Exeption value) exeption,
    required TResult Function(_AuthExeption value) authExeption,
  }) {
    return noRecord(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_Exeption value)? exeption,
    TResult Function(_AuthExeption value)? authExeption,
  }) {
    return noRecord?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_Exeption value)? exeption,
    TResult Function(_AuthExeption value)? authExeption,
    required TResult orElse(),
  }) {
    if (noRecord != null) {
      return noRecord(this);
    }
    return orElse();
  }
}

abstract class _NoRecord implements Failure {
  const factory _NoRecord([final String? message]) = _$_NoRecord;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_NoRecordCopyWith<_$_NoRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ExeptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$_ExeptionCopyWith(
          _$_Exeption value, $Res Function(_$_Exeption) then) =
      __$$_ExeptionCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_ExeptionCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$$_ExeptionCopyWith<$Res> {
  __$$_ExeptionCopyWithImpl(
      _$_Exeption _value, $Res Function(_$_Exeption) _then)
      : super(_value, (v) => _then(v as _$_Exeption));

  @override
  _$_Exeption get _value => super._value as _$_Exeption;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_Exeption(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Exeption implements _Exeption {
  const _$_Exeption([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.exeption(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Exeption &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ExeptionCopyWith<_$_Exeption> get copyWith =>
      __$$_ExeptionCopyWithImpl<_$_Exeption>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) noRecord,
    required TResult Function(String? message) exeption,
    required TResult Function(String? message) authExeption,
  }) {
    return exeption(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? noRecord,
    TResult Function(String? message)? exeption,
    TResult Function(String? message)? authExeption,
  }) {
    return exeption?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? noRecord,
    TResult Function(String? message)? exeption,
    TResult Function(String? message)? authExeption,
    required TResult orElse(),
  }) {
    if (exeption != null) {
      return exeption(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoRecord value) noRecord,
    required TResult Function(_Exeption value) exeption,
    required TResult Function(_AuthExeption value) authExeption,
  }) {
    return exeption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_Exeption value)? exeption,
    TResult Function(_AuthExeption value)? authExeption,
  }) {
    return exeption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_Exeption value)? exeption,
    TResult Function(_AuthExeption value)? authExeption,
    required TResult orElse(),
  }) {
    if (exeption != null) {
      return exeption(this);
    }
    return orElse();
  }
}

abstract class _Exeption implements Failure {
  const factory _Exeption([final String? message]) = _$_Exeption;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_ExeptionCopyWith<_$_Exeption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthExeptionCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$_AuthExeptionCopyWith(
          _$_AuthExeption value, $Res Function(_$_AuthExeption) then) =
      __$$_AuthExeptionCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_AuthExeptionCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$$_AuthExeptionCopyWith<$Res> {
  __$$_AuthExeptionCopyWithImpl(
      _$_AuthExeption _value, $Res Function(_$_AuthExeption) _then)
      : super(_value, (v) => _then(v as _$_AuthExeption));

  @override
  _$_AuthExeption get _value => super._value as _$_AuthExeption;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_AuthExeption(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthExeption implements _AuthExeption {
  const _$_AuthExeption([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.authExeption(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthExeption &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_AuthExeptionCopyWith<_$_AuthExeption> get copyWith =>
      __$$_AuthExeptionCopyWithImpl<_$_AuthExeption>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) noRecord,
    required TResult Function(String? message) exeption,
    required TResult Function(String? message) authExeption,
  }) {
    return authExeption(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? noRecord,
    TResult Function(String? message)? exeption,
    TResult Function(String? message)? authExeption,
  }) {
    return authExeption?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? noRecord,
    TResult Function(String? message)? exeption,
    TResult Function(String? message)? authExeption,
    required TResult orElse(),
  }) {
    if (authExeption != null) {
      return authExeption(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoRecord value) noRecord,
    required TResult Function(_Exeption value) exeption,
    required TResult Function(_AuthExeption value) authExeption,
  }) {
    return authExeption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_Exeption value)? exeption,
    TResult Function(_AuthExeption value)? authExeption,
  }) {
    return authExeption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_Exeption value)? exeption,
    TResult Function(_AuthExeption value)? authExeption,
    required TResult orElse(),
  }) {
    if (authExeption != null) {
      return authExeption(this);
    }
    return orElse();
  }
}

abstract class _AuthExeption implements Failure {
  const factory _AuthExeption([final String? message]) = _$_AuthExeption;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_AuthExeptionCopyWith<_$_AuthExeption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthFailure {}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class _$$_AuthFailureCopyWith<$Res> {
  factory _$$_AuthFailureCopyWith(
          _$_AuthFailure value, $Res Function(_$_AuthFailure) then) =
      __$$_AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthFailureCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$$_AuthFailureCopyWith<$Res> {
  __$$_AuthFailureCopyWithImpl(
      _$_AuthFailure _value, $Res Function(_$_AuthFailure) _then)
      : super(_value, (v) => _then(v as _$_AuthFailure));

  @override
  _$_AuthFailure get _value => super._value as _$_AuthFailure;
}

/// @nodoc

class _$_AuthFailure implements _AuthFailure {
  _$_AuthFailure();

  @override
  String toString() {
    return 'AuthFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _AuthFailure implements AuthFailure {
  factory _AuthFailure() = _$_AuthFailure;
}
