part of '../i_currency_repo.dart';

class _CurrencyRepoImpl implements ICurrencyRepo {
  final FirebaseDataSource _dataSource;

  _CurrencyRepoImpl(this._dataSource);

  @override
  Stream<Either<Failure, IList<CurrencyModel>>> streamAll() {
    return _dataSource.watchAllCurrencies().onErrorReturnWithFailure();
  }

  @override
  Future<Either<Failure, CurrencyModel>> create(CurrencyModel data) async {
    return await errorHandler(() async {
      final id = await _dataSource.createCurrency(data);
      return right(data.copyWith(id: id));
    });
  }
}
