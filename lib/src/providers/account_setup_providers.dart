import 'package:currency_picker/currency_picker.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/models/account_model.dart';
import 'package:simple_money_tracker/src/data/repositories/repositories.dart';
import 'package:uuid/uuid.dart';

import '../../exports.dart';
import '../data/models/currency_model.dart';

part "account_setup_providers.freezed.dart";

class AccountSetUpProvider {
  const AccountSetUpProvider._();

  static final save =
      StateNotifierProvider.autoDispose<SaveAccountSetUpNotifier, AsyncValue<bool>>(
          (ref) {
    return SaveAccountSetUpNotifier(ref.read);
  });

  static final data =
      StateNotifierProvider.autoDispose<AccountSetUpDataNotifier, AccountSetUpState>(
          (ref) {
    return AccountSetUpDataNotifier();
  });
}

class SaveAccountSetUpNotifier extends StateNotifier<AsyncValue<bool>> {
  SaveAccountSetUpNotifier(this._reader) : super(const AsyncValue.data(false));

  final Reader _reader;

  Future<void> call() async {
    if (state.isLoading) return;
    if (state == const AsyncValue.data(true)) return;

    final data = _reader(AccountSetUpProvider.data);
    if (!data.isValidForSave) {
      state = const AsyncValue.error(Failure.invalidValue());
      return;
    }

    state = const AsyncValue.loading();

    final currency = await _createDefaultCurrency(data);
    if (currency == null) return;

    final result = await _reader(accountRepoProvider).create(
      AccountModel(
        balance: data.initialBalance,
        totalIncome: data.initialBalance,
        defaultCurrencyId: currency.id,
        selectedCurrencyId: null,
      ),
    );

    state = result.fold(
      AsyncValue.error,
      (_) => const AsyncValue.data(true),
    );
  }

  Future<CurrencyModel?> _createDefaultCurrency(AccountSetUpState data) async {
    final currency = data.defaultCurrency.getOrCrash();

    final result = await _reader(currencyRepoProvider).create(
      CurrencyModel(
        id: const Uuid().v1(),
        currency: currency,
        isDefault: true,
        exchangedRate: null,
      ),
    );
    return result.fold(
      (failure) => failure.maybeWhen(
        uniqueConstrant: (_, currency) => currency as CurrencyModel?,
        orElse: () {
          state = AsyncValue.error(failure);
          return null;
        },
      ),
      id,
    );
  }
}

class AccountSetUpDataNotifier extends StateNotifier<AccountSetUpState> {
  AccountSetUpDataNotifier() : super(AccountSetUpState());

  void onBalanceChanged(String? value) {
    final parsed = double.tryParse(value ?? "");
    if (parsed != null) {
      state = state.copyWith(initialBalance: parsed);
    }
  }

  void onCurrencyChanged(Currency currency) {
    state = state.copyWith(defaultCurrency: some(currency));
  }
}

@freezed
class AccountSetUpState with _$AccountSetUpState {
  const AccountSetUpState._();

  factory AccountSetUpState({
    @Default(None()) Option<Currency> defaultCurrency,
    @Default(0) double initialBalance,
  }) = _AccountSetUpState;

  bool get isValidForSave => defaultCurrency.isSome();
}
