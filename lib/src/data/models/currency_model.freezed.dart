// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'currency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) {
  return _CurrencyModel.fromJson(json);
}

/// @nodoc
mixin _$CurrencyModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: CurrencyModel.currencyKey, fromJson: CurrencyModel._fromJson)
  Currency get currency => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Exchange rate with default currency. should be null if this is the default currency this calculate how (1 default currency) = ?
  double? get exchangedRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyModelCopyWith<CurrencyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyModelCopyWith<$Res> {
  factory $CurrencyModelCopyWith(
          CurrencyModel value, $Res Function(CurrencyModel) then) =
      _$CurrencyModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      @JsonKey(name: CurrencyModel.currencyKey, fromJson: CurrencyModel._fromJson)
          Currency currency,
      bool isDefault,
      double? exchangedRate});
}

/// @nodoc
class _$CurrencyModelCopyWithImpl<$Res>
    implements $CurrencyModelCopyWith<$Res> {
  _$CurrencyModelCopyWithImpl(this._value, this._then);

  final CurrencyModel _value;
  // ignore: unused_field
  final $Res Function(CurrencyModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? currency = freezed,
    Object? isDefault = freezed,
    Object? exchangedRate = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      exchangedRate: exchangedRate == freezed
          ? _value.exchangedRate
          : exchangedRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_CurrencyModelCopyWith<$Res>
    implements $CurrencyModelCopyWith<$Res> {
  factory _$$_CurrencyModelCopyWith(
          _$_CurrencyModel value, $Res Function(_$_CurrencyModel) then) =
      __$$_CurrencyModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      @JsonKey(name: CurrencyModel.currencyKey, fromJson: CurrencyModel._fromJson)
          Currency currency,
      bool isDefault,
      double? exchangedRate});
}

/// @nodoc
class __$$_CurrencyModelCopyWithImpl<$Res>
    extends _$CurrencyModelCopyWithImpl<$Res>
    implements _$$_CurrencyModelCopyWith<$Res> {
  __$$_CurrencyModelCopyWithImpl(
      _$_CurrencyModel _value, $Res Function(_$_CurrencyModel) _then)
      : super(_value, (v) => _then(v as _$_CurrencyModel));

  @override
  _$_CurrencyModel get _value => super._value as _$_CurrencyModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? currency = freezed,
    Object? isDefault = freezed,
    Object? exchangedRate = freezed,
  }) {
    return _then(_$_CurrencyModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      isDefault: isDefault == freezed
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      exchangedRate: exchangedRate == freezed
          ? _value.exchangedRate
          : exchangedRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrencyModel implements _CurrencyModel {
  _$_CurrencyModel(
      {required this.id,
      @JsonKey(name: CurrencyModel.currencyKey, fromJson: CurrencyModel._fromJson)
          required this.currency,
      required this.isDefault,
      required this.exchangedRate});

  factory _$_CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: CurrencyModel.currencyKey, fromJson: CurrencyModel._fromJson)
  final Currency currency;
  @override
  final bool isDefault;

  /// Exchange rate with default currency. should be null if this is the default currency this calculate how (1 default currency) = ?
  @override
  final double? exchangedRate;

  @override
  String toString() {
    return 'CurrencyModel(id: $id, currency: $currency, isDefault: $isDefault, exchangedRate: $exchangedRate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrencyModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            const DeepCollectionEquality().equals(other.isDefault, isDefault) &&
            const DeepCollectionEquality()
                .equals(other.exchangedRate, exchangedRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(currency),
      const DeepCollectionEquality().hash(isDefault),
      const DeepCollectionEquality().hash(exchangedRate));

  @JsonKey(ignore: true)
  @override
  _$$_CurrencyModelCopyWith<_$_CurrencyModel> get copyWith =>
      __$$_CurrencyModelCopyWithImpl<_$_CurrencyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyModelToJson(this);
  }
}

abstract class _CurrencyModel implements CurrencyModel {
  factory _CurrencyModel(
      {required final String id,
      @JsonKey(name: CurrencyModel.currencyKey, fromJson: CurrencyModel._fromJson)
          required final Currency currency,
      required final bool isDefault,
      required final double? exchangedRate}) = _$_CurrencyModel;

  factory _CurrencyModel.fromJson(Map<String, dynamic> json) =
      _$_CurrencyModel.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: CurrencyModel.currencyKey, fromJson: CurrencyModel._fromJson)
  Currency get currency;
  @override
  bool get isDefault;
  @override

  /// Exchange rate with default currency. should be null if this is the default currency this calculate how (1 default currency) = ?
  double? get exchangedRate;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyModelCopyWith<_$_CurrencyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
