import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';
import 'package:simple_money_tracker/src/providers/category_providers.dart';

import '../../../exports.dart';
import '../../core/core.dart';
import '../../widgets/widgets.dart';

class AddCategoryDialog extends HookConsumerWidget {
  const AddCategoryDialog({Key? key, required this.tranType}) : super(key: key);

  static void show(BuildContext context, {required TranType type}) async {
    return showDialog(
      context: context,
      builder: (_) => AddCategoryDialog(tranType: type),
    );
  }

  final TranType tranType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(CategoryProvider.save);
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    ref.listen<AsyncValue<bool>>(
      CategoryProvider.save,
      (previous, next) {
        if (previous != next && next == const AsyncValue.data(true)) {
          EasyLoading.showToast('New category added');
          nameController.clear();
          Navigator.pop(context);
        }
      },
    );

    return BaseConfirmDialog(
      title: 'New ${tranType.name} Category',
      confirmBtnText: 'Save',
      isConfirmBtnLoading: state.isLoading,
      onConfirmBtnTap: () async {
        if (formKey.currentState!.validate()) {
          await ref.read(CategoryProvider.save.notifier).create(
                name: nameController.text.trim(),
                type: tranType,
              );
        }
      },
      backgroundColor: AS.whiteBackground(context),
      child: Form(
        key: formKey,
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
    );
  }
}
