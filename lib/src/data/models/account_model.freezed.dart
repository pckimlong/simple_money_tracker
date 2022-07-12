// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) {
  return _AccountModel.fromJson(json);
}

/// @nodoc
mixin _$AccountModel {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountModelCopyWith<$Res> {
  factory $AccountModelCopyWith(
          AccountModel value, $Res Function(AccountModel) then) =
      _$AccountModelCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountModelCopyWithImpl<$Res> implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._value, this._then);

  final AccountModel _value;
  // ignore: unused_field
  final $Res Function(AccountModel) _then;
}

/// @nodoc
abstract class _$$_AccountModelCopyWith<$Res> {
  factory _$$_AccountModelCopyWith(
          _$_AccountModel value, $Res Function(_$_AccountModel) then) =
      __$$_AccountModelCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AccountModelCopyWithImpl<$Res>
    extends _$AccountModelCopyWithImpl<$Res>
    implements _$$_AccountModelCopyWith<$Res> {
  __$$_AccountModelCopyWithImpl(
      _$_AccountModel _value, $Res Function(_$_AccountModel) _then)
      : super(_value, (v) => _then(v as _$_AccountModel));

  @override
  _$_AccountModel get _value => super._value as _$_AccountModel;
}

/// @nodoc
@JsonSerializable()
class _$_AccountModel implements _AccountModel {
  _$_AccountModel();

  factory _$_AccountModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountModelFromJson(json);

  @override
  String toString() {
    return 'AccountModel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AccountModel);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountModelToJson(this);
  }
}

abstract class _AccountModel implements AccountModel {
  factory _AccountModel() = _$_AccountModel;

  factory _AccountModel.fromJson(Map<String, dynamic> json) =
      _$_AccountModel.fromJson;
}
