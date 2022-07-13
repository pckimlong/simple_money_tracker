// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      tranType: $enumDecode(_$TranTypeEnumMap, json['tranType']),
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tranType': _$TranTypeEnumMap[instance.tranType]!,
    };

const _$TranTypeEnumMap = {
  TranType.income: 'income',
  TranType.expenses: 'expenses',
};
