import 'package:simple_money_tracker/src/modules/transaction/add/widgets/tran_detail_form_page.dart';
import 'package:simple_money_tracker/src/providers/tran_providers.dart';

import '../../../../exports.dart';
import '../../../core/core.dart';
import 'widgets/category_picker.dart';

final _pageControllerProvider = Provider.autoDispose<PageController>((ref) {
  final controller = PageController();
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});

class AddTransactionBottomsheet extends HookConsumerWidget {
  const AddTransactionBottomsheet({Key? key}) : super(key: key);

  static void nextPage(WidgetRef ref) {
    ref.read(_pageControllerProvider).nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
  }

  static void previousPage(WidgetRef ref) {
    ref.read(_pageControllerProvider).animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
  }

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
    ref.listen<AsyncValue<bool>>(
      TranProvider.save,
      (previous, next) {
        // When success
        if (previous?.isLoading == true && next == const AsyncValue.data(true)) {
          context.popRoute();
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
              physics: const NeverScrollableScrollPhysics(),
              controller: ref.watch(_pageControllerProvider),
              children: const [
                CategoryPicker(),
                TranDetailFormPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
