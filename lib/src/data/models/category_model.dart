import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

typedef CategoryId = String;

@freezed
class CategoryModel with _$CategoryModel {
  factory CategoryModel({
    required CategoryId? id,
    required String name,
    required TranType tranType,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
