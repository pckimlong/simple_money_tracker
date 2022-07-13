import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_model.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

typedef TranId = String;

enum TranType { income, expenses }

@freezed
class Transaction with _$Transaction {
  const factory Transaction.income({
    @Default(TranType.income) TranType type,
    required TranId? id,
    required CategoryId categoryId,
    required double amount,
    required DateTime date,
    required String note,
    required DateTime createdAt,
  }) = Income;
  const factory Transaction.expenses({
    @Default(TranType.expenses) TranType type,
    required TranId? id,
    required CategoryId categoryId,
    required double amount,
    required DateTime date,
    required String note,
    required DateTime createdAt,
  }) = Expenses;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
