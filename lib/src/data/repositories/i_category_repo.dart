import 'package:simple_money_tracker/exports.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/datasource/firebase_datasource.dart';
import 'package:simple_money_tracker/src/data/models/category_model.dart';
part 'impls/category_repo_impl.dart';

final categoryRepoProvider = Provider<ICategoryRepo>((ref) {
  return _CategoryRepoImpl(ref.watch(datasourceProvider));
});

abstract class ICategoryRepo {
  Stream<Either<Failure, IList<CategoryModel>>> streamAll();
  Future<Either<Failure, CategoryModel>> create(CategoryModel model);
}
