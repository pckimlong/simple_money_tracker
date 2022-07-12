import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_money_tracker/src/data/models/transaction.dart';

part 'category.freezed.dart';
part 'category.g.dart';

typedef CategoryId = String;

@freezed
class Category with _$Category {
  factory Category({
    required CategoryId? id,
    required String name,
    required TranType tranType,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
