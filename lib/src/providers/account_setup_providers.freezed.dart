// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_setup_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountSetUpState {
  Option<Currency> get defaultCurrency => throw _privateConstructorUsedError;
  double get initialBalance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountSetUpStateCopyWith<AccountSetUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSetUpStateCopyWith<$Res> {
  factory $AccountSetUpStateCopyWith(
          AccountSetUpState value, $Res Function(AccountSetUpState) then) =
      _$AccountSetUpStateCopyWithImpl<$Res>;
  $Res call({Option<Currency> defaultCurrency, double initialBalance});
}

/// @nodoc
class _$AccountSetUpStateCopyWithImpl<$Res>
    implements $AccountSetUpStateCopyWith<$Res> {
  _$AccountSetUpStateCopyWithImpl(this._value, this._then);

  final AccountSetUpState _value;
  // ignore: unused_field
  final $Res Function(AccountSetUpState) _then;

  @override
  $Res call({
    Object? defaultCurrency = freezed,
    Object? initialBalance = freezed,
  }) {
    return _then(_value.copyWith(
      defaultCurrency: defaultCurrency == freezed
          ? _value.defaultCurrency
          : defaultCurrency // ignore: cast_nullable_to_non_nullable
              as Option<Currency>,
      initialBalance: initialBalance == freezed
          ? _value.initialBalance
          : initialBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_AccountSetUpStateCopyWith<$Res>
    implements $AccountSetUpStateCopyWith<$Res> {
  factory _$$_AccountSetUpStateCopyWith(_$_AccountSetUpState value,
          $Res Function(_$_AccountSetUpState) then) =
      __$$_AccountSetUpStateCopyWithImpl<$Res>;
  @override
  $Res call({Option<Currency> defaultCurrency, double initialBalance});
}

/// @nodoc
class __$$_AccountSetUpStateCopyWithImpl<$Res>
    extends _$AccountSetUpStateCopyWithImpl<$Res>
    implements _$$_AccountSetUpStateCopyWith<$Res> {
  __$$_AccountSetUpStateCopyWithImpl(
      _$_AccountSetUpState _value, $Res Function(_$_AccountSetUpState) _then)
      : super(_value, (v) => _then(v as _$_AccountSetUpState));

  @override
  _$_AccountSetUpState get _value => super._value as _$_AccountSetUpState;

  @override
  $Res call({
    Object? defaultCurrency = freezed,
    Object? initialBalance = freezed,
  }) {
    return _then(_$_AccountSetUpState(
      defaultCurrency: defaultCurrency == freezed
          ? _value.defaultCurrency
          : defaultCurrency // ignore: cast_nullable_to_non_nullable
              as Option<Currency>,
      initialBalance: initialBalance == freezed
          ? _value.initialBalance
          : initialBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_AccountSetUpState extends _AccountSetUpState {
  _$_AccountSetUpState(
      {this.defaultCurrency = const None(), this.initialBalance = 0})
      : super._();

  @override
  @JsonKey()
  final Option<Currency> defaultCurrency;
  @override
  @JsonKey()
  final double initialBalance;

  @override
  String toString() {
    return 'AccountSetUpState(defaultCurrency: $defaultCurrency, initialBalance: $initialBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountSetUpState &&
            const DeepCollectionEquality()
                .equals(other.defaultCurrency, defaultCurrency) &&
            const DeepCollectionEquality()
                .equals(other.initialBalance, initialBalance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(defaultCurrency),
      const DeepCollectionEquality().hash(initialBalance));

  @JsonKey(ignore: true)
  @override
  _$$_AccountSetUpStateCopyWith<_$_AccountSetUpState> get copyWith =>
      __$$_AccountSetUpStateCopyWithImpl<_$_AccountSetUpState>(
          this, _$identity);
}

abstract class _AccountSetUpState extends AccountSetUpState {
  factory _AccountSetUpState(
      {final Option<Currency> defaultCurrency,
      final double initialBalance}) = _$_AccountSetUpState;
  _AccountSetUpState._() : super._();

  @override
  Option<Currency> get defaultCurrency;
  @override
  double get initialBalance;
  @override
  @JsonKey(ignore: true)
  _$$_AccountSetUpStateCopyWith<_$_AccountSetUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
