// ignore_for_file: invalid_annotation_target

import 'package:currency_picker/currency_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_model.freezed.dart';
part 'currency_model.g.dart';

typedef CurrencyId = String;

@freezed
class CurrencyModel with _$CurrencyModel {
  static const currencyKey = "currency";
  static const isDefaultKey = "isDefault";

  factory CurrencyModel({
    required CurrencyId id,
    @JsonKey(name: CurrencyModel.currencyKey, fromJson: CurrencyModel._fromJson)
        required Currency currency,
    @JsonKey(name: CurrencyModel.isDefaultKey) required bool isDefault,

    /// Exchange rate with default currency. should be null if this is the default currency this calculate how (1 default currency) = ?
    required double? exchangedRate,
  }) = _CurrencyModel;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  static Currency _fromJson(dynamic json) {
    return Currency.from(json: json);
  }
}
