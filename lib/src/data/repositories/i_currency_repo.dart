import 'package:simple_money_tracker/exports.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/datasource/firebase_datasource.dart';
import 'package:simple_money_tracker/src/data/models/currency_model.dart';

part 'impls/currency_repo_impl.dart';

final currencyRepoProvider = Provider<ICurrencyRepo>((ref) {
  return _CurrencyRepoImpl(ref.watch(datasourceProvider));
});

abstract class ICurrencyRepo {
  Stream<Either<Failure, IList<CurrencyModel>>> streamAll();
  Future<Either<Failure, CurrencyModel>> create(CurrencyModel data);
}
