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
  String get userId => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  double get totalIncome => throw _privateConstructorUsedError;
  CurrencyModel get defaultCurrency => throw _privateConstructorUsedError;
  CurrencyModel? get selectedCurrency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountModelCopyWith<AccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountModelCopyWith<$Res> {
  factory $AccountModelCopyWith(
          AccountModel value, $Res Function(AccountModel) then) =
      _$AccountModelCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      double balance,
      double totalIncome,
      CurrencyModel defaultCurrency,
      CurrencyModel? selectedCurrency});

  $CurrencyModelCopyWith<$Res> get defaultCurrency;
  $CurrencyModelCopyWith<$Res>? get selectedCurrency;
}

/// @nodoc
class _$AccountModelCopyWithImpl<$Res> implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._value, this._then);

  final AccountModel _value;
  // ignore: unused_field
  final $Res Function(AccountModel) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? balance = freezed,
    Object? totalIncome = freezed,
    Object? defaultCurrency = freezed,
    Object? selectedCurrency = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: totalIncome == freezed
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      defaultCurrency: defaultCurrency == freezed
          ? _value.defaultCurrency
          : defaultCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyModel,
      selectedCurrency: selectedCurrency == freezed
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyModel?,
    ));
  }

  @override
  $CurrencyModelCopyWith<$Res> get defaultCurrency {
    return $CurrencyModelCopyWith<$Res>(_value.defaultCurrency, (value) {
      return _then(_value.copyWith(defaultCurrency: value));
    });
  }

  @override
  $CurrencyModelCopyWith<$Res>? get selectedCurrency {
    if (_value.selectedCurrency == null) {
      return null;
    }

    return $CurrencyModelCopyWith<$Res>(_value.selectedCurrency!, (value) {
      return _then(_value.copyWith(selectedCurrency: value));
    });
  }
}

/// @nodoc
abstract class _$$_AccountModelCopyWith<$Res>
    implements $AccountModelCopyWith<$Res> {
  factory _$$_AccountModelCopyWith(
          _$_AccountModel value, $Res Function(_$_AccountModel) then) =
      __$$_AccountModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      double balance,
      double totalIncome,
      CurrencyModel defaultCurrency,
      CurrencyModel? selectedCurrency});

  @override
  $CurrencyModelCopyWith<$Res> get defaultCurrency;
  @override
  $CurrencyModelCopyWith<$Res>? get selectedCurrency;
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

  @override
  $Res call({
    Object? userId = freezed,
    Object? balance = freezed,
    Object? totalIncome = freezed,
    Object? defaultCurrency = freezed,
    Object? selectedCurrency = freezed,
  }) {
    return _then(_$_AccountModel(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: totalIncome == freezed
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      defaultCurrency: defaultCurrency == freezed
          ? _value.defaultCurrency
          : defaultCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyModel,
      selectedCurrency: selectedCurrency == freezed
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountModel extends _AccountModel {
  _$_AccountModel(
      {required this.userId,
      required this.balance,
      required this.totalIncome,
      required this.defaultCurrency,
      required this.selectedCurrency})
      : super._();

  factory _$_AccountModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountModelFromJson(json);

  @override
  final String userId;
  @override
  final double balance;
  @override
  final double totalIncome;
  @override
  final CurrencyModel defaultCurrency;
  @override
  final CurrencyModel? selectedCurrency;

  @override
  String toString() {
    return 'AccountModel(userId: $userId, balance: $balance, totalIncome: $totalIncome, defaultCurrency: $defaultCurrency, selectedCurrency: $selectedCurrency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountModel &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.balance, balance) &&
            const DeepCollectionEquality()
                .equals(other.totalIncome, totalIncome) &&
            const DeepCollectionEquality()
                .equals(other.defaultCurrency, defaultCurrency) &&
            const DeepCollectionEquality()
                .equals(other.selectedCurrency, selectedCurrency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(balance),
      const DeepCollectionEquality().hash(totalIncome),
      const DeepCollectionEquality().hash(defaultCurrency),
      const DeepCollectionEquality().hash(selectedCurrency));

  @JsonKey(ignore: true)
  @override
  _$$_AccountModelCopyWith<_$_AccountModel> get copyWith =>
      __$$_AccountModelCopyWithImpl<_$_AccountModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountModelToJson(this);
  }
}

abstract class _AccountModel extends AccountModel {
  factory _AccountModel(
      {required final String userId,
      required final double balance,
      required final double totalIncome,
      required final CurrencyModel defaultCurrency,
      required final CurrencyModel? selectedCurrency}) = _$_AccountModel;
  _AccountModel._() : super._();

  factory _AccountModel.fromJson(Map<String, dynamic> json) =
      _$_AccountModel.fromJson;

  @override
  String get userId;
  @override
  double get balance;
  @override
  double get totalIncome;
  @override
  CurrencyModel get defaultCurrency;
  @override
  CurrencyModel? get selectedCurrency;
  @override
  @JsonKey(ignore: true)
  _$$_AccountModelCopyWith<_$_AccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}
