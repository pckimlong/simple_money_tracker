part of '../i_user_repo.dart';

class _UserRepoImpl implements IUserRepo {
  final FirebaseDataSource _dataSource;

  _UserRepoImpl(this._dataSource);

  @override
  Stream<Either<Failure, UserModel>> watchOne() {
    return _dataSource.watchData().map((event) {
      if (event == null) return left<Failure, UserModel>(const Failure.noRecord());
      return right<Failure, UserModel>(event);
    }).onErrorReturnWithFailure();
  }
}
