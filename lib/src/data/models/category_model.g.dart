// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      tranType: $enumDecode(_$TranTypeEnumMap, json['tranType']),
      iconIndex: json['iconIndex'] as int,
      iconColorValue: json['iconColorValue'] as int,
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tranType': _$TranTypeEnumMap[instance.tranType]!,
      'iconIndex': instance.iconIndex,
      'iconColorValue': instance.iconColorValue,
    };

const _$TranTypeEnumMap = {
  TranType.expense: 'expense',
  TranType.income: 'income',
};
