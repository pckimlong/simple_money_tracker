// ignore_for_file: invalid_annotation_target

import 'package:simple_money_tracker/exports.dart';
import 'package:simple_money_tracker/src/core/app_icons.dart';

import 'tran_model.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

typedef CategoryId = String;

@freezed
class CategoryModel with _$CategoryModel {
  CategoryModel._();

  static const idKey = "id";
  static const nameKey = "name";
  static const tranTypeKey = "tranType";

  factory CategoryModel({
    @JsonKey(name: CategoryModel.idKey) required CategoryId id,
    @JsonKey(name: CategoryModel.nameKey) required String name,
    @JsonKey(name: CategoryModel.tranTypeKey) required TranType tranType,
    required int iconIndex,
    required int iconColorValue,
  }) = _CategoryModel;

  IconData get iconData => categoryIcons[iconIndex];
  Color get iconColor => Color(iconColorValue);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  factory CategoryModel.empty({TranType? tranType}) {
    return CategoryModel(
      id: '',
      name: '',
      tranType: tranType ?? TranType.income,
      iconIndex: 0,
      iconColorValue: 0,
    );
  }
}
