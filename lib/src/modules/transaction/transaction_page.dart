import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/datasource/firebase_datasource.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';
import 'package:simple_money_tracker/src/modules/transaction/add/add_transaction_bottomsheet.dart';

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
            onPressed: () {},
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              EasyLoading.show();
              await ref
                  .watch(datasourceProvider)
                  .createIncomeTran(
                    Income(
                      id: null,
                      categoryId: "categoryId",
                      amount: 20,
                      date: DateTime.now(),
                      note: "",
                      createdAt: DateTime.now(),
                    ),
                  )
                  .catchError(
                    (error, stackTrace) => EasyLoading.showError(error.toString()),
                  );
              EasyLoading.dismiss();
            },
            child: const Text(
              'Test Add income',
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                EasyLoading.show();
                await ref
                    .watch(datasourceProvider)
                    .updateIncomeTran(
                      Income(
                        id: "TiJcZjxRbMKSuefZ5aHD",
                        categoryId: "categoryId",
                        amount: 100,
                        date: DateTime.now(),
                        note: "",
                        createdAt: DateTime.now(),
                      ),
                    )
                    .catchError(
                      (error, stackTrace) => EasyLoading.showError(error.toString()),
                    );
                EasyLoading.dismiss();
              },
              child: const Text('Test Update income')),
        ],
      ),
    );
  }
}

class _Balance extends ConsumerWidget {
  const _Balance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 26,
      height: 1,
    );
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

class _RootBody extends ConsumerWidget {
  const _RootBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
