part of '../i_auth_repo.dart';

class _AuthRepoImpl implements IAuthRepo {
  final FirebaseAuth _auth;

  _AuthRepoImpl(this._auth);

  @override
  Stream<UserId?> watchUserIdStateChanged() {
    return _auth.authStateChanges().map((event) => event?.uid);
  }
}
