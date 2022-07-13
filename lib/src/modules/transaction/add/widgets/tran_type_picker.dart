import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import '../../../../../exports.dart';
import '../../../../core/core.dart';

class TranTypePicker extends HookConsumerWidget {
  const TranTypePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = useState<int>(0);
    final tabController = useTabController(initialLength: 2);
    useEffect(() {
      tabController.addListener(() {
        tabIndex.value = tabController.index;
      });
      return null;
    }, [tabController]);

    return Column(
      children: [
        FlutterToggleTab(
          width: context.screenWidth * 0.23,
          height: AS.buttonHeight - 4,
          borderRadius: AS.radiusValue,
          selectedIndex: tabController.index,
          selectedTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          unSelectedTextStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
          labels: const ['Expense', 'Income'],
          icons: const [Icons.upload_rounded, Icons.download_rounded],
          selectedLabelIndex: (index) {
            tabIndex.value = index;
            tabController.animateTo(index);
          },
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: const [
              _ExpanseList(),
              _IncomeList(),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExpanseList extends ConsumerWidget {
  const _ExpanseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

class _IncomeList extends ConsumerWidget {
  const _IncomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
