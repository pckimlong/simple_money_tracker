import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/data/models/account_model.dart';
import 'package:simple_money_tracker/src/data/models/currency_model.dart';
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
}
