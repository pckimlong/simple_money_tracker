import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/models/currency_model.dart';
import 'package:simple_money_tracker/src/providers/currency_providers.dart';

import '../../../../exports.dart';

class CurrencyTextWidget extends ConsumerWidget {
  const CurrencyTextWidget({
    Key? key,
    required this.value,
    this.currencyModel,
    this.textBuilder,
    this.textStyle,
  }) : super(key: key);

  /// Use for build text by currency, If null, account currency will be used
  final CurrencyModel? currencyModel;
  final double value;
  final TextStyle? textStyle;

  final Widget Function(
    BuildContext context,
    String convertedText,
    CurrencyModel currencyModel,
  )? textBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyAsync = ref.watch(CurrencyProvider.currentCurrency);
    return currencyAsync.when(
      data: (curr) {
        if (textBuilder != null) {
          return textBuilder!(context, value.formatCurrency(curr.currency), curr);
        }
        return Text(value.formatCurrency(curr.currency), style: textStyle);
      },
      error: (err, __) => Text(value.formatCurrency(), style: textStyle),
      loading: () => Text(value.formatCurrency(), style: textStyle),
    );
  }
}
