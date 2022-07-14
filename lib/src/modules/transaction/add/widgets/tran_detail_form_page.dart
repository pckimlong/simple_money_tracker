import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/providers/currency_providers.dart';
import 'package:simple_money_tracker/src/providers/tran_providers.dart';

import '../../../../../exports.dart';
import '../../../../widgets/widgets.dart';
import '../../../tools/enter_amount/enter_amount_widget.dart';
import '../add_transaction_bottomsheet.dart';

class TranDetailFormPage extends HookConsumerWidget {
  const TranDetailFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(
        text: ref.read(TranProvider.addStateData).amount.toString());

    final currency = ref.watch(CurrencyProvider.currentCurrency
        .select((value) => value.valueOrNull?.currency.symbol ?? ""));

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _Header(),
        AS.hGap12,
        Expanded(
          child: Column(
            children: [
              MyTextFormField(
                controller: controller,
                autofocus: false,
                hintText: 'Amount',
                backgroundColor: Colors.transparent,
                textAlign: TextAlign.end,
                readonly: true,
                maxLines: 3,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.sentences,
                minLines: 1,
                // prefixText: category.map((t) => t.name).getOrElse(() => '') +
                //     (currency.isEmpty ? "" : " ($currency):"),
                // preffixTextStyle: const TextStyle(
                //   fontSize: 18,
                //   fontWeight: FontWeight.bold,
                // ),
                // suffixText: "$currency ",
                // suffixTextStyle: const TextStyle(
                //   fontWeight: FontWeight.bold,
                //   fontSize: 38,
                //   height: 1.2,
                // ),
                focusBorder: const OutlineInputBorder(
                  borderRadius: AS.roundedBorderRadius,
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
        EnterAmountWidget(
          initialNumber: num.tryParse(controller.text),
          onDisplayTextChanged: (value) {
            controller.text = "$currency $value";
          },
          onDonePressed: (value) {
            Navigator.pop(context);
          },
          onResultChanged: (value) {
            if (value != null) {
              ref
                  .read(TranProvider.addStateData.notifier)
                  .onAmountChanged(value.toDouble());
            }
          },
        )
      ],
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(TranProvider.addStateData
        .select((value) => value.category.map((t) => t.name).getOrElse(() => '')));
    final type = ref.watch(TranProvider.addStateData
        .select((value) => value.tranType.map((t) => t.name.tr()).getOrElse(() => '')));

    return Container(
      height: AS.bottomSheetHeaderHeight,
      padding: const EdgeInsets.symmetric(horizontal: AS.sidePadding),
      decoration: BoxDecoration(
        color: AS.whiteBackground(context),
        boxShadow: const [AS.defaultShadow],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => AddTransactionBottomsheet.previousPage(ref),
            icon: const Icon(Icons.arrow_back_ios),
            iconSize: 18,
          ),
          AS.wGap4,
          Text(
            "$type - $category",
            style: AS.bottomsheetTitleTextStyle(context),
          ),
        ],
      ),
    );
  }
}
