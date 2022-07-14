// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tran_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Income _$$IncomeFromJson(Map<String, dynamic> json) => _$Income(
      type: $enumDecodeNullable(_$TranTypeEnumMap, json['type']) ?? TranType.income,
      id: json['id'] as String?,
      categoryId: json['categoryId'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$IncomeToJson(_$Income instance) => <String, dynamic>{
      'type': _$TranTypeEnumMap[instance.type]!,
      'id': instance.id,
      'categoryId': instance.categoryId,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
      'runtimeType': instance.$type,
    };

const _$TranTypeEnumMap = {
  TranType.expense: 'expense',
  TranType.income: 'income',
};

_$Expenses _$$ExpensesFromJson(Map<String, dynamic> json) => _$Expenses(
      type: $enumDecodeNullable(_$TranTypeEnumMap, json['type']) ?? TranType.expense,
      id: json['id'] as String?,
      categoryId: json['categoryId'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ExpensesToJson(_$Expenses instance) => <String, dynamic>{
      'type': _$TranTypeEnumMap[instance.type]!,
      'id': instance.id,
      'categoryId': instance.categoryId,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
      'runtimeType': instance.$type,
    };
