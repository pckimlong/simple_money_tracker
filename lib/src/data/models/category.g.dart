// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as String?,
      name: json['name'] as String,
      tranType: $enumDecode(_$TranTypeEnumMap, json['tranType']),
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tranType': _$TranTypeEnumMap[instance.tranType]!,
    };

const _$TranTypeEnumMap = {
  TranType.income: 'income',
  TranType.expenses: 'expenses',
};
