import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_money_tracker/src/data/models/currency_model.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

typedef UserId = String;

@freezed
class AccountModel with _$AccountModel {
  const AccountModel._();

  factory AccountModel({
    required UserId userId,
    required double balance,
    required double totalIncome,
    required CurrencyModel defaultCurrency,
    required CurrencyModel? selectedCurrency,
  }) = _AccountModel;

  CurrencyModel get currency => selectedCurrency ?? defaultCurrency;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}
