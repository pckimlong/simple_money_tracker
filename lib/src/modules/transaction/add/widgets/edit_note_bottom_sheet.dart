import '../../../../../../exports.dart';
import '../../../../core/core.dart';
import '../../../../widgets/widgets.dart';

class EditNoteBottomSheet extends HookConsumerWidget {
  const EditNoteBottomSheet({Key? key, required this.initialText}) : super(key: key);

  static Future<String?> show(BuildContext context, {String initial = ""}) async {
    return await showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: EditNoteBottomSheet(initialText: initial),
          ),
        );
      },
    );
  }

  final String? initialText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController(text: initialText);
    return Container(
      color: AS.whiteBackground(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetHeader(
            title: 'Add Note',
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, textController.text.trim()),
                child: const Text('SAVE'),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AS.sidePadding),
            child: MyTextFormField(
              controller: textController,
              hintText: 'Type note',
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 14,
              minLines: 3,
            ),
          ),
          AS.hGap16,
        ],
      ),
    );
  }
}
