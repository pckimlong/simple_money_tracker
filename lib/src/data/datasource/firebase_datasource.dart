import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/models/account_model.dart';
import 'package:simple_money_tracker/src/data/models/category_model.dart';
import 'package:simple_money_tracker/src/data/models/currency_model.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';
import 'firebase_helpers.dart';
import '../../../exports.dart';

final datasourceProvider = Provider<FirebaseDataSource>((ref) {
  return FirebaseDataSource(ref.watch(firestoreProvider));
});

class FirebaseDataSource {
  FirebaseDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  Future<void> createCurrency(CurrencyModel currencyModel) async {
    await _checkNewCurrency(currencyModel);
    final currenciesDoc = _firestore.currenciesDoc;

    currenciesDoc.set({
      currencyModel.id: currencyModel.toJson(),
    }, SetOptions(merge: true));
  }

  Future<void> updateCurrency(CurrencyModel currencyModel) async {
    final currenciesDoc = _firestore.currenciesDoc;
    currenciesDoc.update({
      currencyModel.id: currencyModel.toJson(),
    });
  }

  Future<void> deleteCurrency(CurrencyId id) async {
    final currenciesDoc = _firestore.currenciesDoc;
    final docData = await _firestore.currenciesDoc.get();

    final isDefaultCurrency = docData.data()?[id]?[CurrencyModel.isDefaultKey] as bool?;
    if (isDefaultCurrency == null) throw Failure.noRecord('No currency with id: $id');
    if (isDefaultCurrency) {
      throw const Failure.restrictedTask('Cannot delete default currency');
    }

    await currenciesDoc.update({id: FieldValue.delete()});
  }

  Future<void> createAccount(AccountModel accountModel) async {
    await _throwExceptionIfAccountAlreadyCreated();
    await _firestore.accountDoc.set(accountModel);
  }

  Stream<AccountModel?> watchAccountData() {
    return _firestore.accountDoc.snapshots().map((event) => event.data());
  }

  Stream<Either<Failure, IList<CurrencyModel>>> watchAllCurrencies() {
    return _firestore.currenciesDoc.snapshots().map((event) {
      final jsonList = event.data()?.values.toList() ?? [];
      return right(jsonList.map((e) => CurrencyModel.fromJson(e)).toIList());
    });
  }

  Future<Income?> createIncomeTran(Income model) async {
    assert(model.type == TranType.income);

    final docRef = _firestore.tranColl.doc();
    docRef.set(model.copyWith(id: docRef.id));
    incrementAccountBalance(model.amount, includeTotalIncome: true);
    return model.copyWith(id: docRef.id);
  }

  Future<Expenses?> createExpenseTran(Expenses model) async {
    assert(model.type == TranType.expense);

    final docRef = _firestore.tranColl.doc();
    docRef.set(model.copyWith(id: docRef.id));
    incrementAccountBalance(
      model.amount.toNegative(),
      includeTotalIncome: false,
    );
    return model.copyWith(id: docRef.id);
  }

  Future<void> updateIncomeTran(Income model) async {
    assert(model.type == TranType.income);
    assert(model.id != null);

    final oldDoc = await _firestore.tranColl.doc(model.id).get();
    if (!oldDoc.exists) throw Failure.noRecord('Cannot find transaction with id:$id');
    _firestore.tranColl.doc(model.id).set(model);
    final updateAmount = model.amount - oldDoc.data()!.amount;
    _firestore.accountDoc.update({
      AccountModel.balanceKey: FieldValue.increment(updateAmount),
      AccountModel.totalIncomeKey: FieldValue.increment(updateAmount),
    });
  }

  Future<void> createCategory(CategoryModel data) async {
    await _checkNewCategoryName(data);
    final doc = _firestore.categoriesDoc;
    doc.set({
      data.id: data.toJson(),
    }, SetOptions(merge: true));
  }

  Future<void> updateCategory(CategoryModel data) async {
    final docRef = _firestore.categoriesDoc;
    try {
      docRef.update({data.id: data.toJson()});
    } on FirebaseException catch (e) {
      if (e.code == "not-found" || e.code == "cloud_firestore/not-found") {
        createCategory(data);
        return;
      }
      rethrow;
    }
  }

  Stream<Either<Failure, IList<CategoryModel>>> watchAllCategories() {
    return _firestore.categoriesDoc.snapshots().map((event) {
      final jsonList = event.data()?.values.toList() ?? [];
      return right(jsonList.map((e) => CategoryModel.fromJson(e)).toIList());
    });
  }

  Future<void> deleteCategory(String categoryId) async {
    final docRef = _firestore.categoriesDoc;
    docRef.update({categoryId: FieldValue.delete()});
  }

  Future<void> _throwExceptionIfAccountAlreadyCreated() async {
    final result = await _firestore.accountDoc.get();
    if (result.exists) {
      throw const Failure.restrictedTask(
          'Cannot create create account, because account is already existed');
    }
  }

  Future<void> _checkNewCurrency(CurrencyModel currencyModel) async {
    final result = await _firestore.currenciesDoc.get();
    final existed = result.data()?[currencyModel.id] != null
        ? CurrencyModel.fromJson(result[currencyModel.id])
        : null;

    if (existed != null) {
      if (existed.currency.code == currencyModel.currency.code) {
        throw Failure.uniqueConstrant(
            'Currency with code: ${currencyModel.currency.code} is already existed',
            result.data()![currencyModel.id]);
      }
    }
  }

  Future<void> _checkNewCategoryName(CategoryModel data) async {
    final result = await _firestore.categoriesDoc.get();
    final map = result.data();
    if (map != null && map.isNotEmpty) {
      for (final value in map.values) {
        if (value[CategoryModel.nameKey] == data.name.trim() &&
            value[CategoryModel.tranTypeKey] == data.tranType.name) {
          throw Failure.uniqueConstrant(
              'Category name: ${data.name} is already existed');
        }
      }
    }
  }

  @visibleForTesting
  void incrementAccountBalance(double amount, {required bool includeTotalIncome}) {
    assert(!amount.isInfinite || !amount.isNaN);
    assert(amount.isFinite);

    _firestore.accountDoc.update({
      AccountModel.balanceKey: FieldValue.increment(amount),
      if (includeTotalIncome) AccountModel.totalIncomeKey: FieldValue.increment(amount),
    });
  }
}
