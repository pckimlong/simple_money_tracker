part of '../i_category_repo.dart';

class _CategoryRepoImpl implements ICategoryRepo {
  final FirebaseDataSource _dataSource;

  _CategoryRepoImpl(this._dataSource);

  @override
  Stream<Either<Failure, IList<CategoryModel>>> streamAll() {
    return _dataSource.watchAllCategories().onErrorReturnWithFailure();
  }

  @override
  Future<Either<Failure, CategoryModel>> create(CategoryModel model) async {
    return await errorHandler(() async {
      await _dataSource.createCategory(model);
      return right(model);
    });
  }
}
