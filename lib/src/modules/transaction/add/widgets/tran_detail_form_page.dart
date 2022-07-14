import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/modules/setting/datetime_format/datetime_format_widget.dart';
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
    final shakerKey = useMemoized(() => GlobalKey<ShakerState>());
    final currency = ref.watch(CurrencyProvider.currentCurrency
        .select((value) => value.valueOrNull?.currency.symbol ?? ""));

    final controller = useTextEditingController(
      text:
          "$currency ${ref.read(TranProvider.addStateData).amount > 0 ? ref.read(TranProvider.addStateData).amount : "0"}",
    );

    ref.listen<AsyncValue<bool>>(TranProvider.save, (previous, next) {});

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _Header(),
        AS.hGap12,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _NoteAndDate(),
              Shaker(
                key: shakerKey,
                child: MyTextFormField(
                  controller: controller,
                  autofocus: false,
                  hintText: 'Amount',
                  backgroundColor: Colors.transparent,
                  // textAlign: TextAlign.end,
                  readonly: true,
                  maxLines: 3,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                  minLines: 1,
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
              ),
            ],
          ),
        ),
        EnterAmountWidget(
          initialNumber: num.tryParse(controller.text),
          onDisplayTextChanged: (value) {
            controller.text = "$currency $value";
          },
          onDonePressed: (value) async {
            if (value == 0) {
              shakerKey.currentState!.shake();
              EasyLoading.showToast(
                'Amount must greater than zero',
                toastPosition: EasyLoadingToastPosition.top,
              );
              return;
            }
            await ref.read(TranProvider.save.notifier).create();
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

class _NoteAndDate extends ConsumerWidget {
  const _NoteAndDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final note = ref.watch(TranProvider.addStateData.select((value) => value.note));
    final date = ref.watch(TranProvider.addStateData.select((value) => value.onDate));

    return Padding(
      padding: const EdgeInsets.all(AS.sidePadding),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.calendar_month),
              AS.wGap16,
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final now = DateTime.now();
                    final result = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2000),
                      lastDate: now + 3600.days,
                      locale: context.locale,
                    );
                    if (result != null) {
                      ref
                          .read(TranProvider.addStateData.notifier)
                          .onDateChanged(result);
                    }
                  },
                  child: DateFormatWidget(
                      value: date,
                      showWeekdayPrefix: true,
                      builder: (_, text, __) {
                        return Text(
                          text,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
          // AS.hGap16,
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.subject),
              AS.wGap16,
              Expanded(
                child: MyTextFormField(
                  maxLines: 2,
                  readonly: true,
                  hintText: 'Add note',
                  contentPadding: const EdgeInsets.all(0),
                  borderColor: Colors.transparent,
                  focusBorder: InputBorder.none,
                  backgroundColor: Colors.transparent,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
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
      width: double.infinity,
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
          Expanded(
            child: Text(
              "$type ($category)",
              style: AS.bottomsheetTitleTextStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}
