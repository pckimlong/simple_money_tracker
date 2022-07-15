// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/modules/setting/datetime_format/datetime_format_widget.dart';
import 'package:simple_money_tracker/src/modules/transaction/add/widgets/edit_note_bottom_sheet.dart';
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
              const _DetailItem(),
              Shaker(
                key: shakerKey,
                child: MyTextFormField(
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
                  focusBorder: const OutlineInputBorder(
                    borderRadius: AS.roundedBorderRadius,
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
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

class _DetailItem extends ConsumerWidget {
  const _DetailItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(TranProvider.addStateData);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AS.sidePadding,
        vertical: 8,
      ),
      child: Column(
        children: [
          _Item(
            leading: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: context.colors.primary.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.shop),
            ),
            content: InkWell(
              onTap: () => AddTransactionBottomsheet.previousPage(ref),
              child: Text(
                state.category.map((t) => t.name).getOrElse(() => ''),
                style: context.textTheme.titleMedium,
              ),
            ),
          ),
          AS.hGap20,
          _Item(
            leading: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.calendar_month),
            ),
            content: InkWell(
              onTap: () async {
                final now = DateTime.now();
                final result = await showDatePicker(
                  context: context,
                  initialDate: state.onDate,
                  firstDate: DateTime(2000),
                  lastDate: now + 3600.days,
                  locale: context.locale,
                );
                if (result != null) {
                  ref.read(TranProvider.addStateData.notifier).onDateChanged(result);
                }
              },
              child: DateFormatWidget(
                  value: state.onDate,
                  showWeekdayPrefix: true,
                  builder: (_, text, __) {
                    return Text(
                      text,
                      style: context.textTheme.titleMedium,
                    );
                  }),
            ),
          ),
          AS.hGap20,
          _Item(
            leading: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.subject),
            ),
            content: InkWell(
              onTap: () async {
                final result =
                    await EditNoteBottomSheet.show(context, initial: state.note);
                if (result != null) {
                  ref.read(TranProvider.addStateData.notifier).onNoteChanged(result);
                }
              },
              child: state.note.isBlank
                  ? Text(
                      'Tap to enter note',
                      style: TextStyle(color: context.theme.hintColor),
                    )
                  : ExpandableText(
                      state.note,
                      maxLines: 3,
                      expandText: 'Show more',
                      onLinkTap: () async {
                        final result = await EditNoteBottomSheet.show(context,
                            initial: state.note);
                        if (result != null) {
                          ref
                              .read(TranProvider.addStateData.notifier)
                              .onNoteChanged(result);
                        }
                      },
                    ),
            ),
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
      child: _Item(
        showExpandMoreIcon: false,
        leading: InkWell(
          onTap: () => AddTransactionBottomsheet.previousPage(ref),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
        ),
        content: Text(
          type,
          style: AS.bottomsheetTitleTextStyle(context),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.leading,
    required this.content,
    this.showExpandMoreIcon = true,
  }) : super(key: key);

  final Widget leading;
  final Widget content;
  final bool showExpandMoreIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 50,
          child: leading,
        ),
        Expanded(child: content),
        if (showExpandMoreIcon)
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
          )
      ],
    );
  }
}
