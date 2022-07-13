import 'package:simple_money_tracker/exports.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/models/category_model.dart';

abstract class ICategoryRepo {
  Stream<Either<Failure, IList<CategoryModel>>> streamAll();
}
