import 'package:simple_money_tracker/exports.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/models/currency_model.dart';
import 'package:simple_money_tracker/src/providers/account_providers.dart';

import '../data/repositories/i_currency_repo.dart';

class CurrencyProvider {
  const CurrencyProvider._();

  /// Crash if default currency id is not founded
  static final defaultCurrency = Provider.autoDispose<AsyncValue<CurrencyModel>>((ref) {
    final id = ref.watch(AccountProvider.dataOption.select(
        (value) => value.whenData((value) => value.toNullable()?.defaultCurrencyId)));
    if (id.hasError) return AsyncValue.error(id.error!);
    if (id.isLoading) return const AsyncValue.loading();
    return ref.watch(watchOneById(id.value!)).whenData((value) => value.getOrCrash());
  });

  /// Crash if default currency id is not founded
  static final currentCurrency = Provider.autoDispose<AsyncValue<CurrencyModel>>((ref) {
    final id = ref.watch(AccountProvider.dataOption
        .select((value) => value.whenData((value) => value.toNullable()?.currencyId)));
    if (id.hasError) return AsyncValue.error(id.error!);
    if (id.isLoading) return const AsyncValue.loading();
    if (id.valueOrNull == null) return const AsyncValue.error(Failure.noRecord());
    return ref.watch(watchOneById(id.value!)).whenData((value) => value.getOrCrash());
  });

  static final watchOneById = Provider.autoDispose
      .family<AsyncValue<Option<CurrencyModel>>, CurrencyId?>((ref, id) {
    if (id == null) return AsyncValue.data(none());
    return ref.watch(streamAll).whenData(
          (list) => Option.fromNullable(list.firstOrNullWhere((e) => e.id == id)),
        );
  });

  static final streamAll =
      StateProvider.autoDispose<AsyncValue<IList<CurrencyModel>>>((ref) {
    return ref
        .watch(streamAllEither)
        .whenData((value) => value.fold((l) => throw l, id));
  });

  static final streamAllEither =
      StreamProvider.autoDispose<Either<Failure, IList<CurrencyModel>>>((ref) {
    return ref.watch(currencyRepoProvider).streamAll();
  });
}
