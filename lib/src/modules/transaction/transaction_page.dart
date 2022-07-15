import 'dart:math';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/modules/transaction/add/add_transaction_bottomsheet.dart';
import 'package:simple_money_tracker/src/providers/cache_providers.dart';

import '../../../exports.dart';
import '../../providers/account_providers.dart';
import '../currency/widget/currency_text_widget.dart';

const double _kAppBarHeight = kToolbarHeight + 4;
const double _kAppBarBottomHeight = 16;

class TransactionPage extends ConsumerWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        leading: const SizedBox.expand(),
        title: const _Balance(),
        toolbarHeight: _kAppBarHeight,
        elevation: 0,
        leadingWidth: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () {
              // context.setLocale(const Locale('en'));
              // ChooseDateFormatDialog.show(context);
              final randomIndex = Random().nextInt(FlexScheme.values.length - 1);
              ref.read(CacheProvider.flexScheme.notifier).state =
                  FlexScheme.values[randomIndex];
            },
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddTransactionBottomsheet.show(context);
        },
        child: const Icon(Icons.add),
      ),
      body: Center(child: Text(ref.watch(CacheProvider.flexScheme).toString())),
    );
  }
}

class _Balance extends ConsumerWidget {
  const _Balance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 26, height: 1);
    final balance = ref.watch(AccountProvider.balance);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AS.sidePadding),
      child: CurrencyTextWidget(
        value: balance,
        textStyle: textStyle,
        textBuilder: (_, text, model) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total in ${model.currency.code}',
                style: context.textTheme.titleSmall,
              ),
              Text(
                text,
                style: textStyle,
              ),
            ],
          );
        },
      ),
    );
  }
}
