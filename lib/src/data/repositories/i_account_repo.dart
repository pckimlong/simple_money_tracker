import 'package:simple_money_tracker/src/core/app_errors.dart';
import 'package:simple_money_tracker/src/data/datasource/firebase_datasource.dart';
import 'package:simple_money_tracker/src/data/models/account_model.dart';

import '../../../exports.dart';
part 'impls/account_repo_impl.dart';

final accountRepoProvider = Provider<IAccountRepo>((ref) {
  return _AccountRepoImpl(ref.watch(datasourceProvider));
});

abstract class IAccountRepo {
  Stream<Either<Failure, AccountModel>> watchOne();
  Future<Either<Failure, AccountModel>> create(AccountModel data);
}
