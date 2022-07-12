import 'package:simple_money_tracker/src/data/models/user_model.dart';
import 'package:simple_money_tracker/src/data/repositories/i_auth_repo.dart';

import '../../exports.dart';

class AuthProvider {
  const AuthProvider._();

  static final isAuthenticated = Provider.autoDispose<AsyncValue<bool>>((ref) {
    return ref.watch(uuidProvider).whenData((value) => value != null);
  });

  static final uuidProvider = StreamProvider<UserId?>((ref) {
    return ref.watch(authRepoProvider).watchUserIdStateChanged();
  });
}
