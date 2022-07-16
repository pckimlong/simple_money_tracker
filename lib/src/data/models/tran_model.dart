// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_model.dart';

part 'tran_model.freezed.dart';
part 'tran_model.g.dart';

typedef TranId = String;

enum TranType { expense, income }

@freezed
class TranModel with _$TranModel {
  const TranModel._();

  static int _dateParserToJson(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }

  static DateTime _dateParserFromJson(int millisecondsSinceEpoch) {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  const factory TranModel.expenses({
    @Default(TranType.expense)
        TranType type,
    required TranId? id,
    required CategoryId categoryId,
    required double amount,
    @JsonKey(
      name: TranModel.dateKey,
      toJson: TranModel._dateParserToJson,
      fromJson: TranModel._dateParserFromJson,
    )
        required DateTime date,
    required String note,
    required DateTime createdAt,
  }) = Expenses;

  factory TranModel.fromJson(Map<String, dynamic> json) => _$TranModelFromJson(json);

  const factory TranModel.income({
    @Default(TranType.income)
        TranType type,
    required TranId? id,
    required CategoryId categoryId,
    required double amount,
    @JsonKey(
      name: TranModel.dateKey,
      toJson: TranModel._dateParserToJson,
      fromJson: TranModel._dateParserFromJson,
    )
        required DateTime date,
    required String note,
    required DateTime createdAt,
  }) = Income;

  static const dateKey = "date";
}
