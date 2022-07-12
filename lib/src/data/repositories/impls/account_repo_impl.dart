part of '../i_account_repo.dart';

class _AccountRepoImpl implements IAccountRepo {
  final FirebaseDataSource _dataSource;

  _AccountRepoImpl(this._dataSource);

  @override
  Stream<Either<Failure, AccountModel>> watchOne() {
    return _dataSource.watchAccountData().map((event) {
      if (event == null) return left<Failure, AccountModel>(const Failure.noRecord());
      return right<Failure, AccountModel>(event);
    }).onErrorReturnWithFailure();
  }

  @override
  Future<Either<Failure, AccountModel>> create(AccountModel data) async {
    return await errorHandler(() async {
      await _dataSource.createAccount(data);
      return right(data);
    });
  }
}
