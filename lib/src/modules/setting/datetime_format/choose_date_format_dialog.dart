import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/providers/cache_providers.dart';
import 'package:simple_money_tracker/src/widgets/widgets.dart';

import '../../../../exports.dart';

class ChooseDateFormatDialog extends HookConsumerWidget {
  const ChooseDateFormatDialog({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const ChooseDateFormatDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState<DateFormatPatterns>(ref.read(CacheProvider.dateFormat));

    return BaseConfirmDialog(
      title: 'Choose date format',
      confirmBtnText: 'Save',
      onConfirmBtnTap: () {
        ref.read(CacheProvider.dateFormat.notifier).state = selected.value;
        context.popRoute();
      },
      child: SizedBox(
        height: 200,
        width: context.screenWidth,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: DateFormatPatterns.values
              .map(
                (e) => SelectableItem(
                  onTap: () => selected.value = e,
                  isSelected: selected.value == e,
                  margin: const EdgeInsets.only(bottom: 4),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(DateFormat(e.pattern, context.locale.countryCode).format(
                    DateTime.now(),
                  )),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
