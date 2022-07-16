import 'package:simple_money_tracker/exports.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/datasource/firebase_datasource.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';

part 'impls/tran_repo_impl.dart';

final tranRepoProvider = Provider<ITranRepo>((ref) {
  return _TranRepoImpl(ref.watch(datasourceProvider));
});

abstract class ITranRepo {
  Future<Either<Failure, TranModel>> create(TranModel model);
  Stream<Either<Failure, IList<TranModel>>> streamByDate({
    required DateTime startedDate,
    required DateTime endedDate,
  });
}
