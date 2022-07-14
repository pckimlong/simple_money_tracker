import 'package:simple_money_tracker/src/modules/transaction/add/widgets/tran_detail_form_page.dart';
import 'package:simple_money_tracker/src/providers/tran_providers.dart';

import '../../../../exports.dart';
import '../../../core/core.dart';
import 'widgets/category_picker.dart';

class AddTransactionBottomsheet extends HookConsumerWidget {
  const AddTransactionBottomsheet({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // enableDrag: false,
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
    final pageController = usePageController();
    ref.listen<AddTranState>(
      TranProvider.addStateData,
      (previous, next) {
        // category
        if (previous?.category != next.category) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
      },
    );

    return Container(
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
            height: context.screenHeight * 0.7,
            child: PageView(
              controller: pageController,
              children: const [
                Padding(padding: EdgeInsets.all(16), child: CategoryPicker()),
                TranDetailFormPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
