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
  @JsonKey(name: AccountModel.balanceKey)
  double get balance => throw _privateConstructorUsedError;
  @JsonKey(name: AccountModel.totalIncomeKey)
  double get totalIncome => throw _privateConstructorUsedError;
  @JsonKey(name: AccountModel.defaultCurrencyIdKey)
  String get defaultCurrencyId => throw _privateConstructorUsedError;
  @JsonKey(name: AccountModel.selectedCurrencyIdKey)
  String? get selectedCurrencyId => throw _privateConstructorUsedError;

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
      {@JsonKey(name: AccountModel.balanceKey)
          double balance,
      @JsonKey(name: AccountModel.totalIncomeKey)
          double totalIncome,
      @JsonKey(name: AccountModel.defaultCurrencyIdKey)
          String defaultCurrencyId,
      @JsonKey(name: AccountModel.selectedCurrencyIdKey)
          String? selectedCurrencyId});
}

/// @nodoc
class _$AccountModelCopyWithImpl<$Res> implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._value, this._then);

  final AccountModel _value;
  // ignore: unused_field
  final $Res Function(AccountModel) _then;

  @override
  $Res call({
    Object? balance = freezed,
    Object? totalIncome = freezed,
    Object? defaultCurrencyId = freezed,
    Object? selectedCurrencyId = freezed,
  }) {
    return _then(_value.copyWith(
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: totalIncome == freezed
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      defaultCurrencyId: defaultCurrencyId == freezed
          ? _value.defaultCurrencyId
          : defaultCurrencyId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCurrencyId: selectedCurrencyId == freezed
          ? _value.selectedCurrencyId
          : selectedCurrencyId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
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
      {@JsonKey(name: AccountModel.balanceKey)
          double balance,
      @JsonKey(name: AccountModel.totalIncomeKey)
          double totalIncome,
      @JsonKey(name: AccountModel.defaultCurrencyIdKey)
          String defaultCurrencyId,
      @JsonKey(name: AccountModel.selectedCurrencyIdKey)
          String? selectedCurrencyId});
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
    Object? balance = freezed,
    Object? totalIncome = freezed,
    Object? defaultCurrencyId = freezed,
    Object? selectedCurrencyId = freezed,
  }) {
    return _then(_$_AccountModel(
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: totalIncome == freezed
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
      defaultCurrencyId: defaultCurrencyId == freezed
          ? _value.defaultCurrencyId
          : defaultCurrencyId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCurrencyId: selectedCurrencyId == freezed
          ? _value.selectedCurrencyId
          : selectedCurrencyId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountModel extends _AccountModel {
  _$_AccountModel(
      {@JsonKey(name: AccountModel.balanceKey)
          required this.balance,
      @JsonKey(name: AccountModel.totalIncomeKey)
          required this.totalIncome,
      @JsonKey(name: AccountModel.defaultCurrencyIdKey)
          required this.defaultCurrencyId,
      @JsonKey(name: AccountModel.selectedCurrencyIdKey)
          required this.selectedCurrencyId})
      : super._();

  factory _$_AccountModel.fromJson(Map<String, dynamic> json) =>
      _$$_AccountModelFromJson(json);

  @override
  @JsonKey(name: AccountModel.balanceKey)
  final double balance;
  @override
  @JsonKey(name: AccountModel.totalIncomeKey)
  final double totalIncome;
  @override
  @JsonKey(name: AccountModel.defaultCurrencyIdKey)
  final String defaultCurrencyId;
  @override
  @JsonKey(name: AccountModel.selectedCurrencyIdKey)
  final String? selectedCurrencyId;

  @override
  String toString() {
    return 'AccountModel(balance: $balance, totalIncome: $totalIncome, defaultCurrencyId: $defaultCurrencyId, selectedCurrencyId: $selectedCurrencyId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountModel &&
            const DeepCollectionEquality().equals(other.balance, balance) &&
            const DeepCollectionEquality()
                .equals(other.totalIncome, totalIncome) &&
            const DeepCollectionEquality()
                .equals(other.defaultCurrencyId, defaultCurrencyId) &&
            const DeepCollectionEquality()
                .equals(other.selectedCurrencyId, selectedCurrencyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(balance),
      const DeepCollectionEquality().hash(totalIncome),
      const DeepCollectionEquality().hash(defaultCurrencyId),
      const DeepCollectionEquality().hash(selectedCurrencyId));

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
      {@JsonKey(name: AccountModel.balanceKey)
          required final double balance,
      @JsonKey(name: AccountModel.totalIncomeKey)
          required final double totalIncome,
      @JsonKey(name: AccountModel.defaultCurrencyIdKey)
          required final String defaultCurrencyId,
      @JsonKey(name: AccountModel.selectedCurrencyIdKey)
          required final String? selectedCurrencyId}) = _$_AccountModel;
  _AccountModel._() : super._();

  factory _AccountModel.fromJson(Map<String, dynamic> json) =
      _$_AccountModel.fromJson;

  @override
  @JsonKey(name: AccountModel.balanceKey)
  double get balance;
  @override
  @JsonKey(name: AccountModel.totalIncomeKey)
  double get totalIncome;
  @override
  @JsonKey(name: AccountModel.defaultCurrencyIdKey)
  String get defaultCurrencyId;
  @override
  @JsonKey(name: AccountModel.selectedCurrencyIdKey)
  String? get selectedCurrencyId;
  @override
  @JsonKey(ignore: true)
  _$$_AccountModelCopyWith<_$_AccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}
