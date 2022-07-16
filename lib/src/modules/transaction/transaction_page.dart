import 'dart:math';

import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';
import 'package:simple_money_tracker/src/modules/setting/datetime_format/datetime_format_widget.dart';
import 'package:simple_money_tracker/src/modules/transaction/add/add_transaction_bottomsheet.dart';
import 'package:simple_money_tracker/src/providers/cache_providers.dart';
import 'package:simple_money_tracker/src/providers/category_providers.dart';
import 'package:simple_money_tracker/src/providers/tran_list_providers.dart';

import '../../../exports.dart';
import '../../providers/account_providers.dart';
import '../currency/widget/currency_text_widget.dart';

const double _kAppBarHeight = kToolbarHeight + 4;

class TransactionPage extends ConsumerWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateCountedAsync = ref.watch(TranListProvider.allDateCount);
    return dateCountedAsync.when(
      data: (count) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AS.whiteBackground(context),
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
          body: Column(
            children: [
              Container(decoration: const BoxDecoration(boxShadow: [AS.lightShadow])),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(child: _SummarizeCard()),
                    ...List.generate(
                      count,
                      (index) => ProviderScope(
                        overrides: [_dateIndexProvider.overrideWithValue(index)],
                        child: const _DayCard(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      error: (err, _) => Text(err.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

final _dateIndexProvider = Provider<int>((ref) {
  throw UnimplementedError();
});

class _DayCard extends ConsumerWidget {
  const _DayCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateIndex = ref.watch(_dateIndexProvider);
    final date = ref.watch(TranListProvider.dateByIndex(dateIndex));
    final trans = ref.watch(TranListProvider.dailyTrans(date)).valueOrNull ??
        const IListConst([]);

    return SliverImplicitlyAnimatedList<TranModel>(
      spawnIsolate: false,
      items: [TranModel.empty().copyWith(id: 'empty'), ...trans],
      areItemsTheSame: (oldTran, newTran) => oldTran.id == newTran.id,
      itemBuilder: (_, itemAnimation, item, index) {
        if (item.id == 'empty') {
          return _CardHeader(
            key: ValueKey(item.id),
          );
        }

        return SizeFadeTransition(
          key: ValueKey(item.id),
          sizeFraction: 0.7,
          curve: Curves.easeInOut,
          animation: itemAnimation,
          child: ProviderScope(
            overrides: [
              _itemProvider.overrideWithValue(
                TranDateAndIndex(date: date, index: index - 1),
              ),
            ],
            child: const _TranItem(),
          ),
        );
      },
    );
  }
}

class _CardHeader extends ConsumerWidget {
  const _CardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateIndex = ref.watch(_dateIndexProvider);
    final date = ref.watch(TranListProvider.dateByIndex(dateIndex));
    final amount = ref.watch(TranListProvider.totalDailyAmount(date));

    return Container(
      margin: const EdgeInsets.only(top: AS.sidePadding, bottom: 1),
      decoration: BoxDecoration(color: AS.whiteBackground(context)),
      padding: const EdgeInsets.fromLTRB(AS.sidePadding - 3, 8, AS.sidePadding, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(date.day.toString(), style: const TextStyle(fontSize: 36)),
              AS.wGap12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DateFormatWidget(
                    value: date,
                    customPattern: 'EEEE',
                    builder: (context, text, pattern) {
                      return Text(
                        text,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      );
                    },
                  ),
                  DateFormatWidget(
                    value: date,
                    useTodayTmrYts: false,
                    customPattern: 'MMMM yyyy',
                    builder: (context, text, pattern) {
                      return Text(text.toUpperCase());
                    },
                  ),
                ],
              ),
            ],
          ),
          CurrencyTextWidget(
            value: amount.valueOrNull ?? 0,
            textStyle: const TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

final _itemProvider = Provider<TranDateAndIndex>((ref) {
  throw UnimplementedError();
});

class _TranItem extends ConsumerWidget {
  const _TranItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(_itemProvider);
    final tran = ref.watch(TranListProvider.tranDetail(filter));
    final category = ref.watch(CategoryProvider.ofId(tran.categoryId));

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: AS.sidePadding,
      ),
      decoration: BoxDecoration(
        color: AS.whiteBackground(context),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: category.value!.iconColor.withOpacity(0.3),
            ),
            child: Icon(category.value!.iconData),
          ),
          AS.wGap12,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category.valueOrNull?.name ?? "...",
                      style: const TextStyle(fontSize: 16),
                    ),
                    CurrencyTextWidget(
                      key: const ValueKey('amount'),
                      value: tran.amount,
                      textBuilder: (_, text, currency) {
                        return tran.map(
                          expenses: (value) => Text(
                            "- $text",
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          income: (value) => Text(
                            "+ $text",
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                const Text("Nothing"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummarizeCard extends ConsumerWidget {
  const _SummarizeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseIncome = ref
        .watch(TranListProvider.expenseIncome)
        .maybeWhen(data: id, orElse: () => ExpanseIncome(expense: 0, income: 0));

    return Container(
      padding: const EdgeInsets.only(top: AS.sidePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              constraints: const BoxConstraints(minHeight: 80),
              decoration: BoxDecoration(
                color: AS.whiteBackground(context),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: AS.roundedBorderRadius,
                    ),
                    child: Icon(Icons.upload_rounded, color: Colors.red[400]),
                  ),
                  AS.wGap12,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Expense', style: context.textTheme.caption),
                      CurrencyTextWidget(
                        value: expenseIncome.expense,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          AS.wGap12,
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              constraints: const BoxConstraints(minHeight: 80),
              decoration: BoxDecoration(
                color: AS.whiteBackground(context),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: AS.roundedBorderRadius,
                    ),
                    child: Icon(
                      Icons.download_rounded,
                      color: Colors.green[400],
                    ),
                  ),
                  AS.wGap12,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Income', style: context.textTheme.caption),
                      CurrencyTextWidget(
                        value: expenseIncome.income,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
