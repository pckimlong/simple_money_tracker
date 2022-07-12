// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountModel _$$_AccountModelFromJson(Map<String, dynamic> json) =>
    _$_AccountModel(
      userId: json['userId'] as String,
      balance: (json['balance'] as num).toDouble(),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      defaultCurrency: CurrencyModel.fromJson(
          json['defaultCurrency'] as Map<String, dynamic>),
      selectedCurrency: json['selectedCurrency'] == null
          ? null
          : CurrencyModel.fromJson(
              json['selectedCurrency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AccountModelToJson(_$_AccountModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'balance': instance.balance,
      'totalIncome': instance.totalIncome,
      'defaultCurrency': instance.defaultCurrency.toJson(),
      'selectedCurrency': instance.selectedCurrency?.toJson(),
    };
