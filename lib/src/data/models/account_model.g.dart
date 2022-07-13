// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountModel _$$_AccountModelFromJson(Map<String, dynamic> json) =>
    _$_AccountModel(
      balance: (json['balance'] as num).toDouble(),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      defaultCurrencyId: json['defaultCurrencyId'] as String,
      selectedCurrencyId: json['selectedCurrencyId'] as String?,
    );

Map<String, dynamic> _$$_AccountModelToJson(_$_AccountModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'totalIncome': instance.totalIncome,
      'defaultCurrencyId': instance.defaultCurrencyId,
      'selectedCurrencyId': instance.selectedCurrencyId,
    };
