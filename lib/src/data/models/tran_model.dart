import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_model.dart';

part 'tran_model.freezed.dart';
part 'tran_model.g.dart';

typedef TranId = String;

enum TranType { expense, income }

@freezed
class TranModel with _$TranModel {
  const factory TranModel.income({
    @Default(TranType.income) TranType type,
    required TranId? id,
    required CategoryId categoryId,
    required double amount,
    required DateTime date,
    required String note,
    required DateTime createdAt,
  }) = Income;
  const factory TranModel.expenses({
    @Default(TranType.expense) TranType type,
    required TranId? id,
    required CategoryId categoryId,
    required double amount,
    required DateTime date,
    required String note,
    required DateTime createdAt,
  }) = Expenses;

  factory TranModel.fromJson(Map<String, dynamic> json) => _$TranModelFromJson(json);
}
