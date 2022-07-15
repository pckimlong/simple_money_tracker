import 'package:flutter/foundation.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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
                  type: TranType.values[tabController.index],
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
                selectedBackgroundColors: [context.colors.primary],
                unSelectedBackgroundColors: [context.colors.background],
                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                unSelectedTextStyle: TextStyle(
                  color: context.theme.hintColor.withOpacity(0.6),
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

class _CategoryListBuilder extends HookConsumerWidget {
  const _CategoryListBuilder({Key? key, required this.tranType}) : super(key: key);

  final TranType tranType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useMemoized(() => ItemScrollController());

    final listAsync = ref.watch(tranType == TranType.income
        ? CategoryProvider.incomeCategories
        : CategoryProvider.expenseCategories);

    useMemoized(() {
      Future.microtask(
        () {
          final category = ref.read(TranProvider.addStateData).category;
          category.match(
            (selected) {
              final index = listAsync.valueOrNull?.indexOf(selected);
              if (index != null && index >= 0) {
                scrollController.jumpTo(index: index);
              }
            },
            () => null,
          );
        },
      );
    });

    return listAsync.when(
      data: (categories) {
        return ScrollablePositionedList.builder(
          itemScrollController: scrollController,
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: categories.length,
          itemBuilder: (_, index) {
            final data = categories[index];
            return ProviderScope(
              overrides: [_itemProvider.overrideWithValue(data)],
              child: const _CategoryListItem(),
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

final _itemProvider = Provider<CategoryModel>((ref) {
  throw UnimplementedError();
});

class _CategoryListItem extends ConsumerWidget {
  const _CategoryListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(_itemProvider);
    final selecedId = ref.watch(
        TranProvider.addStateData.select((value) => value.category.map((t) => t.id)));

    return SelectableItem(
      isEndIndicator: true,
      isSelected: selecedId.match((id) => data.id == id, () => false),
      onTap: () {
        ref.read(TranProvider.addStateData.notifier).onCategoryChanged(data);
        AddTransactionBottomsheet.nextPage(ref);
      },
      radius: 4,
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: context.colors.primary.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.shop),
          ),
          AS.wGap12,
          Text(
            data.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
