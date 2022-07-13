import 'package:simple_money_tracker/src/data/models/account_model.dart';
import 'package:simple_money_tracker/src/data/repositories/repositories.dart';

import '../../exports.dart';
import '../core/core.dart';
import 'auth_providers.dart';

class AccountProvider {
  const AccountProvider._();

  static final hasSetup = Provider<AsyncValue<bool>>(
    (ref) {
      final isAuthed = ref.watch(AuthProvider.isAuthenticated);
      if (!isAuthed.hasValue) return isAuthed;
      if (isAuthed.valueOrNull! == false) return const AsyncValue.data(false);
      return ref.watch(stream).whenData(
            (value) => value.fold(
              (failure) => failure.maybeWhen(
                orElse: () => throw failure,
                noRecord: (_) => false,
              ),
              (user) => true,
            ),
          );
    },
  );

  static final balance = Provider.autoDispose<double>((ref) {
    return ref.watch(dataOption).nullable()?.balance ?? 0.0;
  });

  static final dataOption = Provider<AsyncValue<Option<AccountModel>>>((ref) {
    return ref.watch(stream).whenData((value) => value.toOption());
  });

  static final stream = StreamProvider<Either<Failure, AccountModel>>((ref) {
    return ref.watch(accountRepoProvider).watchOne();
  });
}
