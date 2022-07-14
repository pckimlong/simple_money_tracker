import 'package:flutter/foundation.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';
import 'package:simple_money_tracker/src/modules/transaction/add/add_transaction_bottomsheet.dart';
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
    final category =
        ref.watch(TranProvider.addStateData.select((value) => value.category));
    useMemoized(() {
      category.match(
        (model) {
          tabIndex.value = model.tranType.index;
          tabController.index = model.tranType.index;
        },
        () => null,
      );
    }, [category]);

    useEffect(() {
      tabController.addListener(() {
        tabIndex.value = tabController.index;
      });
      return null;
    }, [tabController]);

    return Column(
      children: [
        Container(
          height: AS.bottomSheetHeaderHeight,
          padding: const EdgeInsets.only(left: AS.sidePadding, right: 2),
          decoration: BoxDecoration(
            boxShadow: const [AS.defaultShadow],
            color: AS.whiteBackground(context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'choose_category.title'.tr(),
                style: AS.bottomsheetTitleTextStyle(context),
              ),
              TextButton.icon(
                onPressed: () => AddCategoryDialog.show(
                  context,
                  type: TranType.income,
                ),
                icon: const Icon(Icons.add),
                label: const Text('choose_category.new').tr(),
              )
            ],
          ),
        ),
        AS.hGap20,
        Expanded(
          child: Column(
            children: [
              FlutterToggleTab(
                width: context.screenWidth * 0.23,
                height: AS.buttonHeight - 4,
                borderRadius: AS.radiusValue,
                selectedIndex: tabIndex.value,
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
                labels: [TranType.expense.name.tr(), TranType.income.name.tr()],
                icons: const [Icons.upload_rounded, Icons.download_rounded],
                selectedLabelIndex: (index) {
                  tabIndex.value = index;
                  tabController.animateTo(index);
                },
              ),
              AS.hGap8,
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    _CategoryListBuilder(tranType: TranType.expense),
                    _CategoryListBuilder(tranType: TranType.income)
                  ],
                ),
              ),
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
          itemCount: categories.length,
          itemBuilder: (_, index) {
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
        AddTransactionBottomsheet.nextPage(ref);
      },
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Text(
        data.name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
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
      case TranType.expense:
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
