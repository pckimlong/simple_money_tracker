import '../../../../exports.dart';
import '../../../core/core.dart';
import 'widgets/tran_type_picker.dart';

class AddTransactionBottomsheet extends ConsumerWidget {
  const AddTransactionBottomsheet({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const AddTransactionBottomsheet(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        color: AS.cardColor(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AS.radiusValue),
          topRight: Radius.circular(AS.radiusValue),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 400,
            child: PageView(
              children: const [
                TranTypePicker(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
