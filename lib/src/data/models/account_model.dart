// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_money_tracker/src/data/models/currency_model.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel {
  static const balanceKey = "balance";
  static const totalIncomeKey = "totalIncome";
  static const defaultCurrencyIdKey = "defaultCurrencyId";
  static const selectedCurrencyIdKey = "selectedCurrencyId";

  const AccountModel._();

  factory AccountModel({
    @JsonKey(name: AccountModel.balanceKey) required double balance,
    @JsonKey(name: AccountModel.totalIncomeKey) required double totalIncome,
    @JsonKey(name: AccountModel.defaultCurrencyIdKey)
        required CurrencyId defaultCurrencyId,
    @JsonKey(name: AccountModel.selectedCurrencyIdKey)
        required CurrencyId? selectedCurrencyId,
  }) = _AccountModel;

  CurrencyId get currencyId => selectedCurrencyId ?? defaultCurrencyId;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}
