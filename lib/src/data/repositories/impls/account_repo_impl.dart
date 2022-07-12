part of '../i_account_repo.dart';

class _AccountRepoImpl implements IAccountRepo {
  final FirebaseDataSource _dataSource;

  _AccountRepoImpl(this._dataSource);

  @override
  Stream<Either<Failure, AccountModel>> watchOne() {
    // TODO: implement watchOne
    throw UnimplementedError();
  }
}
