part of '../i_tran_repo.dart';

class _TranRepoImpl implements ITranRepo {
  final FirebaseDataSource _dataSource;

  _TranRepoImpl(this._dataSource);

  @override
  Future<Either<Failure, TranModel>> create(TranModel model) async {
    return await errorHandler(() async {
      final result = await model.map(
        income: _dataSource.createIncomeTran,
        expenses: _dataSource.createExpenseTran,
      );
      return right(result!);
    });
  }

  @override
  Stream<Either<Failure, IList<TranModel>>> streamByDate(
      {required DateTime startedDate, required DateTime endedDate}) {
    return _dataSource
        .watchTransByDate(startedDate, endedDate)
        .onErrorReturnWithFailure();
  }
}
