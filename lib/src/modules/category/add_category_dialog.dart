import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:simple_money_tracker/src/core/app_icons.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';
import 'package:simple_money_tracker/src/providers/category_providers.dart';

import '../../../exports.dart';
import '../../core/core.dart';
import '../../widgets/widgets.dart';

class AddCategoryDialog extends HookConsumerWidget {
  const AddCategoryDialog({Key? key, required this.tranType}) : super(key: key);

  static void show(BuildContext context, {required TranType? type}) async {
    return showDialog(
      context: context,
      builder: (_) => AddCategoryDialog(tranType: type),
    );
  }

  final TranType? tranType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(CategoryProvider.save);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final type = useState<TranType>(tranType ?? TranType.expense);

    ref.listen<AsyncValue<bool>>(
      CategoryProvider.save,
      (previous, next) {
        if (previous != next && next == const AsyncValue.data(true)) {
          EasyLoading.showToast('New category added',
              toastPosition: EasyLoadingToastPosition.bottom);
          nameController.clear();
          Navigator.pop(context);
        }
      },
    );

    return BaseConfirmDialog(
      title: 'New Category',
      confirmBtnText: 'Save',
      isConfirmBtnLoading: state.isLoading,
      onConfirmBtnTap: () async {
        if (formKey.currentState!.validate()) {
          await ref.read(CategoryProvider.save.notifier).create(
                name: nameController.text.trim(),
                type: type.value,
              );
        }
      },
      backgroundColor: AS.whiteBackground(context),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: RadioListTile<TranType>(
                    value: TranType.income,
                    groupValue: type.value,
                    contentPadding: const EdgeInsets.all(0),
                    onChanged: (v) {
                      type.value = v!;
                    },
                    dense: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: AS.roundedBorderRadius,
                    ),
                    title: Text(TranType.income.name).tr(),
                  ),
                ),
                Expanded(
                  child: RadioListTile<TranType>(
                    value: TranType.expense,
                    groupValue: type.value,
                    shape: const RoundedRectangleBorder(
                      borderRadius: AS.roundedBorderRadius,
                    ),
                    dense: true,
                    contentPadding: const EdgeInsets.all(0),
                    onChanged: (v) {
                      type.value = v!;
                    },
                    title: Text(TranType.expense.name).tr(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.primaryColor.withOpacity(0.4),
                  ),
                  child: const Icon(Icons.question_mark),
                ),
                AS.wGap12,
                Expanded(
                  child: MyTextFormField(
                    controller: nameController,
                    autofocus: true,
                    hintText: "Enter Category Name",
                    maxLength: 16,
                    textCapitalization: TextCapitalization.words,
                    errorText: (state.error as Failure?)?.message,
                    counterWidget: const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(8),
              width: context.screenWidth,
              height: 100,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 0,
                  crossAxisCount: 5,
                ),
                itemCount: categoryIcons.length,
                itemBuilder: (_, index) {
                  return const Icon(Icons.holiday_village);
                },
              ),
            ),
            AS.hGap20,
          ],
        ),
      ),
    );
  }
}
