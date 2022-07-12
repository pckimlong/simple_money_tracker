import 'package:firebase_auth/firebase_auth.dart';

import '../../../exports.dart';
import '../models/account_model.dart';

part 'impls/auth_repo_impl.dart';

final authRepoProvider = Provider<IAuthRepo>((ref) {
  return _AuthRepoImpl(ref.watch(firebaseAuthProvider));
});

abstract class IAuthRepo {
  Stream<UserId?> watchUserIdStateChanged();
}
