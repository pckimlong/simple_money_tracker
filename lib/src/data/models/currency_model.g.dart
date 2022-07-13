// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrencyModel _$$_CurrencyModelFromJson(Map<String, dynamic> json) =>
    _$_CurrencyModel(
      id: json['id'] as String,
      currency: CurrencyModel._fromJson(json['currency']),
      isDefault: json['isDefault'] as bool,
      exchangedRate: (json['exchangedRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_CurrencyModelToJson(_$_CurrencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency.toJson(),
      'isDefault': instance.isDefault,
      'exchangedRate': instance.exchangedRate,
    };
