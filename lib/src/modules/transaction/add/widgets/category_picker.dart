import 'package:flutter/foundation.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';
import 'package:simple_money_tracker/src/modules/category/add_category_dialog.dart';
import 'package:simple_money_tracker/src/providers/category_providers.dart';
import 'package:simple_money_tracker/src/widgets/widgets.dart';

import '../../../../../exports.dart';
import '../../../../core/core.dart';

class CategoryPicker extends HookConsumerWidget {
  const CategoryPicker({Key? key}) : super(key: key);

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
              _ExpenseList(),
              _IncomeList(),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExpenseList extends ConsumerWidget {
  const _ExpenseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(CategoryProvider.expenseCategories);
    return listAsync.when(
      data: (categories) {
        /// use scroll list
        return ListView.builder(
          padding: const EdgeInsets.only(top: AS.sidePadding),
          itemCount: categories.length + 1,
          itemBuilder: (_, index) {
            if (index == categories.length) {
              return Padding(
                padding: const EdgeInsets.only(top: AS.sidePadding),
                child: OutlinedButton.icon(
                  onPressed: () => AddCategoryDialog.show(
                    context,
                    type: TranType.expenses,
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text("NEW EXPENSE CATEGORY"),
                ),
              );
            }

            final data = categories[index];
            return SelectableItem(
              isSelected: false,
              margin: const EdgeInsets.only(bottom: 2),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Text(data.name),
            );
          },
        );
      },
      error: (err, __) {
        if (kDebugMode) {
          return Text(err.toString());
        }
        return const Text('No Record');
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _IncomeList extends ConsumerWidget {
  const _IncomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(CategoryProvider.incomeCategories);
    return listAsync.when(
      data: (categories) {
        /// use scroll list
        return ListView.builder(
          padding: const EdgeInsets.only(top: AS.sidePadding),
          itemCount: categories.length + 1,
          itemBuilder: (_, index) {
            if (index == categories.length) {
              return Padding(
                padding: const EdgeInsets.only(top: AS.sidePadding),
                child: OutlinedButton.icon(
                  onPressed: () => AddCategoryDialog.show(
                    context,
                    type: TranType.income,
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text("NEW INCOME CATEGORY"),
                ),
              );
            }

            final data = categories[index];
            return SelectableItem(
              isSelected: false,
              margin: const EdgeInsets.only(bottom: 2),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Text(data.name),
            );
          },
        );
      },
      error: (err, __) {
        if (kDebugMode) {
          return Text(err.toString());
        }
        return const Text('No Record');
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
