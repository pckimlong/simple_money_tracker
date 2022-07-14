import 'package:simple_money_tracker/src/data/models/tran_model.dart';

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
    return AddTranNotifier(ref.read);
  });
}

class SaveTranNotifier extends StateNotifier<AsyncValue<bool>> {
  SaveTranNotifier(this._reader) : super(const AsyncValue.data(false));

  final Reader _reader;
}

class AddTranNotifier extends StateNotifier<AddTranState> {
  AddTranNotifier(this._reader) : super(AddTranState());

  final Reader _reader;

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
