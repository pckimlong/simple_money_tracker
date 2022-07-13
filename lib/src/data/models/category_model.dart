// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'tran_model.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

typedef CategoryId = String;

@freezed
class CategoryModel with _$CategoryModel {
  static const idKey = "id";
  static const nameKey = "name";
  static const tranTypeKey = "tranType";

  factory CategoryModel({
    @JsonKey(name: CategoryModel.idKey) required CategoryId id,
    @JsonKey(name: CategoryModel.nameKey) required String name,
    @JsonKey(name: CategoryModel.tranTypeKey) required TranType tranType,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
