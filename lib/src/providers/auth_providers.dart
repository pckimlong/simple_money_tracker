import 'package:simple_money_tracker/src/data/repositories/i_auth_repo.dart';

import '../../exports.dart';
import '../data/models/user_model.dart';

class AuthProvider {
  const AuthProvider._();

  static final isAuthenticated = Provider<AsyncValue<bool>>((ref) {
    return ref.watch(uuidProvider).whenData((value) => value != null);
  });

  static final uuidProvider = StreamProvider<UserId?>((ref) {
    return ref.watch(authRepoProvider).watchUserIdStateChanged();
  });

  static final signOut =
      StateNotifierProvider.autoDispose<SignOutNotifier, AsyncValue<bool>>((ref) {
    return SignOutNotifier(ref.read);
  });
}

class SignOutNotifier extends StateNotifier<AsyncValue<bool>> {
  SignOutNotifier(this._reader) : super(const AsyncValue.data(false));

  final Reader _reader;

  Future<void> call() async {
    try {
      await _reader(firebaseAuthProvider).signOut();
      state = const AsyncValue.data(true);
    } on Exception catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
