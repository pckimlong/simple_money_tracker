import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';
import 'package:simple_money_tracker/src/data/repositories/repositories.dart';

import '../../exports.dart';
import '../data/models/category_model.dart';
part "tran_providers.freezed.dart";

class TranProvider {
  const TranProvider._();

  static final save =
      StateNotifierProvider.autoDispose<SaveTranNotifier, AsyncValue<bool>>((ref) {
    return SaveTranNotifier(ref.read);
  });

  static final addStateData =
      StateNotifierProvider.autoDispose<AddTranNotifier, AddTranState>((ref) {
    return AddTranNotifier();
  });
}

class SaveTranNotifier extends StateNotifier<AsyncValue<bool>> {
  SaveTranNotifier(this._reader) : super(const AsyncValue.data(false));

  final Reader _reader;

  Future<void> create() async {
    if (state.isLoading || state == const AsyncValue.data(true)) return;

    state = const AsyncValue.loading();
    final data = _reader(TranProvider.addStateData);

    if (data.category.isNone()) {
      state = const AsyncValue.error(Failure.invalidValue('Must select a category'));
      return;
    }

    if (data.amount == 0) {
      state =
          const AsyncValue.error(Failure.invalidValue('Amount must greater than zero'));
      return;
    }

    TranModel toCreate;
    switch (data.tranType.getOrCrash()) {
      case TranType.expense:
        toCreate = TranModel.expenses(
          id: null,
          categoryId: data.category.getOrCrash().id,
          amount: data.amount,
          date: DateTime.now(),
          note: "",
          createdAt: DateTime.now(),
        );
        break;
      case TranType.income:
        toCreate = TranModel.income(
          id: null,
          categoryId: data.category.getOrCrash().id,
          amount: data.amount,
          date: DateTime.now(),
          note: '',
          createdAt: DateTime.now(),
        );
        break;
    }

    final result = await _reader(tranRepoProvider).create(toCreate);
    state = result.fold(
      AsyncValue.error,
      (_) => const AsyncValue.data(true),
    );
  }
}

class AddTranNotifier extends StateNotifier<AddTranState> {
  AddTranNotifier() : super(AddTranState());

  void onCategoryChanged(CategoryModel categoryModel) {
    state = state.copyWith(category: some(categoryModel));
  }

  void onAmountChanged(double value) {
    state = state.copyWith(amount: value);
  }
}

@freezed
class AddTranState with _$AddTranState {
  const AddTranState._();

  factory AddTranState({
    @Default(None()) Option<CategoryModel> category,
    @Default(0) double amount,
  }) = _AddTranState;

  Option<TranType> get tranType => category.map((t) => t.tranType);
}
