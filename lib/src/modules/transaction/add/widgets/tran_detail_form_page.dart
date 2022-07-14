import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/modules/tools/enter_amount/enter_amount_widget.dart';

import '../../../../../exports.dart';
import '../../../../widgets/widgets.dart';

class TranDetailFormPage extends HookConsumerWidget {
  const TranDetailFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyTextFormField(
          controller: controller,
          autofocus: false,
          hintText: 'Amount',
          readonly: true,
          maxLines: 3,
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.sentences,
          height: 20,
          minLines: 1,
          focusBorder: const OutlineInputBorder(
            borderRadius: AS.roundedBorderRadius,
            borderSide: BorderSide(color: Colors.transparent),
          ),
          contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            height: 1.2,
          ),
        ),
        EnterAmountWidget(
          onDisplayTextChanged: (value) {
            controller.text = value;
          },
          onDonePressed: (value) {},
        )
      ],
    );
  }
}
