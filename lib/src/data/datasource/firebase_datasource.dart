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
    await _throwExceptionIfCurrencyAlreadyExisted(currencyModel);
    final currenciesDoc = _firestore.currenciesDoc;

    await currenciesDoc.set({
      currencyModel.id: currencyModel.toJson(),
    }, SetOptions(merge: true));
  }

  Future<void> updateCurrency(CurrencyModel currencyModel) async {
    final currenciesDoc = _firestore.currenciesDoc;
    await currenciesDoc.update({
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

  Future<void> _throwExceptionIfAccountAlreadyCreated() async {
    final result = await _firestore.accountDoc.get();
    if (result.exists) {
      throw const Failure.restrictedTask(
          'Cannot create create account, because account is already existed');
    }
  }

  Future<void> _throwExceptionIfCurrencyAlreadyExisted(
      CurrencyModel currencyModel) async {
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

  Future<Income?> createIncomeTran(Income model) async {
    assert(model.type == TranType.income);

    final docRef = _firestore.tranColl.doc();
    docRef.set(model.copyWith(id: docRef.id));
    _firestore.accountDoc.update({
      AccountModel.balanceKey: FieldValue.increment(model.amount),
      AccountModel.totalIncomeKey: FieldValue.increment(model.amount),
    });
    return model.copyWith(id: docRef.id);
  }

  Future<void> updateIncomeTran(Income model) async {
    assert(model.type == TranType.income);
    assert(model.id != null);

    _updateIncomeTranOffline(model);

    // return _firestore.runTransaction((txn) async {
    //   await _updateIncomeTranOnline(txn, model);
    // }, timeout: const Duration(seconds: 5)).catchError((err, __) async {
    //   log("Update incomeTran transaction exception", error: err);
    //   if (err is FirebaseException) {
    //     if (err.code == "unavailable") {
    //       _updateIncomeTranOffline(model);
    //       return;
    //     } else {
    //       throw err;
    //     }
    //   }
    //   throw err as Exception;
    // });
  }

  Future<void> _updateIncomeTranOnline(Transaction txn, Income income) async {}
  Future<void> _updateIncomeTranOffline(Income income) async {
    final id = income.id!;
    _firestore.tranColl.doc(id).get().then((oldDoc) {
      if (!oldDoc.exists) throw Failure.noRecord('Cannot find transaction with id:$id');
      _firestore.tranColl.doc(id).set(income).then((value) {
        print('to updata amount: ${income.amount}');
        print('old amount: ${oldDoc.data()!.amount}');
        final updateAmount = income.amount - oldDoc.data()!.amount;
        print('total :$updateAmount');
        _firestore.accountDoc.update({
          AccountModel.balanceKey: FieldValue.increment(updateAmount),
          AccountModel.totalIncomeKey: FieldValue.increment(updateAmount),
        });
      });
    });
  }

  Future<void> createCategory(CategoryModel data) async {
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
}
