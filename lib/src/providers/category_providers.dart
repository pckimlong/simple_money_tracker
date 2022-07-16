import 'package:simple_money_tracker/exports.dart';
import 'package:simple_money_tracker/src/data/models/category_model.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';
import 'package:simple_money_tracker/src/data/repositories/i_category_repo.dart';
import 'package:uuid/uuid.dart';

import '../core/core.dart';

class CategoryProvider {
  const CategoryProvider._();

  static final expenseCategories =
      Provider.autoDispose<AsyncValue<IList<CategoryModel>>>((ref) {
    return ref.watch(streamAll).whenData((value) =>
        value.where((element) => element.tranType == TranType.expense).toIList());
  });

  static final incomeCategories =
      Provider.autoDispose<AsyncValue<IList<CategoryModel>>>((ref) {
    return ref.watch(streamAll).whenData((value) =>
        value.where((element) => element.tranType == TranType.income).toIList());
  });

  static final streamAll =
      Provider.autoDispose<AsyncValue<IList<CategoryModel>>>((ref) {
    return ref
        .watch(streamAllEither)
        .whenData((value) => value.fold((l) => throw l, id));
  }, cacheTime: const Duration(minutes: 1));

  static final ofId =
      Provider.autoDispose.family<AsyncValue<CategoryModel?>, CategoryId>((ref, id) {
    return ref
        .watch(streamAll)
        .whenData((value) => value.firstOrNullWhere((element) => element.id == id));
  });

  static final streamAllEither =
      StreamProvider<Either<Failure, IList<CategoryModel>>>((ref) {
    return ref.watch(categoryRepoProvider).streamAll();
  });

  static final save =
      StateNotifierProvider.autoDispose<SaveCategoryNotifier, AsyncValue<bool>>((ref) {
    return SaveCategoryNotifier(ref.read);
  });
}

class SaveCategoryNotifier extends StateNotifier<AsyncValue<bool>> {
  SaveCategoryNotifier(this._reader) : super(const AsyncValue.data(false));

  final Reader _reader;

  Future<void> create({required String name, required TranType type}) async {
    if (state.isLoading || state == const AsyncValue.data(true)) return;
    if (name.trim().isEmpty) {
      state = const AsyncValue.error(Failure.invalidValue('Name must not empty'));
      return;
    }

    state = const AsyncValue.loading();
    final result = await _reader(categoryRepoProvider).create(
      CategoryModel(
        id: const Uuid().v1(),
        name: name,
        tranType: type,
        iconColorValue: Colors.blue.value,
        iconIndex: 0,
      ),
    );
    state = result.fold(
      AsyncValue.error,
      (_) => state = const AsyncValue.data(true),
    );
  }
}
