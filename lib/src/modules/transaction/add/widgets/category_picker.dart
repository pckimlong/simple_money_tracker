import 'package:flutter/foundation.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';
import 'package:simple_money_tracker/src/providers/tran_providers.dart';

import '../../../../../exports.dart';
import '../../../../core/core.dart';
import '../../../../data/models/category_model.dart';
import '../../../../providers/category_providers.dart';
import '../../../../widgets/widgets.dart';
import '../../../category/add_category_dialog.dart';

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
              _CategoryListBuilder(tranType: TranType.expenses),
              _CategoryListBuilder(tranType: TranType.income)
            ],
          ),
        ),
      ],
    );
  }
}

class _CategoryListBuilder extends ConsumerWidget {
  const _CategoryListBuilder({Key? key, required this.tranType}) : super(key: key);

  final TranType tranType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(tranType == TranType.income
        ? CategoryProvider.incomeCategories
        : CategoryProvider.expenseCategories);

    return listAsync.when(
      data: (categories) {
        ///todo use scroll list
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: AS.sidePadding),
          itemCount: categories.length + 1,
          itemBuilder: (_, index) {
            if (index == categories.length) {
              return const _NewCategoryButton(tranType: TranType.income);
            }

            final data = categories[index];
            return _CategoryListItem.overrideWithValue(data);
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

final _itemProvider = Provider<CategoryModel>((ref) {
  throw UnimplementedError();
});

class _CategoryListItem extends ConsumerWidget {
  const _CategoryListItem({Key? key}) : super(key: key);

  static Widget overrideWithValue(CategoryModel categoryModel) {
    return ProviderScope(
      overrides: [_itemProvider.overrideWithValue(categoryModel)],
      child: const _CategoryListItem(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(_itemProvider);
    final selecedId = ref.watch(
        TranProvider.addStateData.select((value) => value.category.map((t) => t.id)));

    return SelectableItem(
      isSelected: selecedId.match((id) => data.id == id, () => false),
      onTap: () {
        ref.read(TranProvider.addStateData.notifier).onCategoryChanged(data);
      },
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Text(data.name),
    );
  }
}

class _NewCategoryButton extends StatelessWidget {
  const _NewCategoryButton({
    Key? key,
    required this.tranType,
  }) : super(key: key);

  final TranType tranType;

  @override
  Widget build(BuildContext context) {
    String label;
    switch (tranType) {
      case TranType.income:
        label = "INCOME";
        break;
      case TranType.expenses:
        label = "EXPENSE";
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(top: AS.sidePadding),
      child: TextButton.icon(
        onPressed: () => AddCategoryDialog.show(
          context,
          type: tranType,
        ),
        icon: const Icon(Icons.add),
        label: Text("NEW $label CATEGORY"),
      ),
    );
  }
}
