import 'package:simple_money_tracker/src/core/app_errors.dart';
import 'package:simple_money_tracker/src/data/datasource/firebase_datasource.dart';
import 'package:simple_money_tracker/src/data/models/user_model.dart';

import '../../../exports.dart';

part 'impls/user_repo_impl.dart';

final userRepoProvider = Provider<IUserRepo>((ref) {
  return _UserRepoImpl(ref.watch(datasourceProvider));
});

abstract class IUserRepo {
  Stream<Either<Failure, UserModel>> watchOne();
}
