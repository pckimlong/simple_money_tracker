// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tran_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddTranState {
  Option<CategoryModel> get category => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddTranStateCopyWith<AddTranState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTranStateCopyWith<$Res> {
  factory $AddTranStateCopyWith(
          AddTranState value, $Res Function(AddTranState) then) =
      _$AddTranStateCopyWithImpl<$Res>;
  $Res call({Option<CategoryModel> category, double amount});
}

/// @nodoc
class _$AddTranStateCopyWithImpl<$Res> implements $AddTranStateCopyWith<$Res> {
  _$AddTranStateCopyWithImpl(this._value, this._then);

  final AddTranState _value;
  // ignore: unused_field
  final $Res Function(AddTranState) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Option<CategoryModel>,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_AddTranStateCopyWith<$Res>
    implements $AddTranStateCopyWith<$Res> {
  factory _$$_AddTranStateCopyWith(
          _$_AddTranState value, $Res Function(_$_AddTranState) then) =
      __$$_AddTranStateCopyWithImpl<$Res>;
  @override
  $Res call({Option<CategoryModel> category, double amount});
}

/// @nodoc
class __$$_AddTranStateCopyWithImpl<$Res>
    extends _$AddTranStateCopyWithImpl<$Res>
    implements _$$_AddTranStateCopyWith<$Res> {
  __$$_AddTranStateCopyWithImpl(
      _$_AddTranState _value, $Res Function(_$_AddTranState) _then)
      : super(_value, (v) => _then(v as _$_AddTranState));

  @override
  _$_AddTranState get _value => super._value as _$_AddTranState;

  @override
  $Res call({
    Object? category = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$_AddTranState(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Option<CategoryModel>,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_AddTranState extends _AddTranState {
  _$_AddTranState({this.category = const None(), this.amount = 0}) : super._();

  @override
  @JsonKey()
  final Option<CategoryModel> category;
  @override
  @JsonKey()
  final double amount;

  @override
  String toString() {
    return 'AddTranState(category: $category, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddTranState &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.amount, amount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(amount));

  @JsonKey(ignore: true)
  @override
  _$$_AddTranStateCopyWith<_$_AddTranState> get copyWith =>
      __$$_AddTranStateCopyWithImpl<_$_AddTranState>(this, _$identity);
}

abstract class _AddTranState extends AddTranState {
  factory _AddTranState(
      {final Option<CategoryModel> category,
      final double amount}) = _$_AddTranState;
  _AddTranState._() : super._();

  @override
  Option<CategoryModel> get category;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$_AddTranStateCopyWith<_$_AddTranState> get copyWith =>
      throw _privateConstructorUsedError;
}
