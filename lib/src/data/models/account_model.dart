import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_money_tracker/src/data/models/currency_model.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel {
  const AccountModel._();

  factory AccountModel({
    required double balance,
    required double totalIncome,
    required CurrencyId defaultCurrencyId,
    required CurrencyId? selectedCurrencyId,
  }) = _AccountModel;

  CurrencyId get currencyId => selectedCurrencyId ?? defaultCurrencyId;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}
