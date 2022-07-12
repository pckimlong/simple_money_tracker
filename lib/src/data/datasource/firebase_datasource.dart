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
  final FirebaseFirestore _firestore;

  FirebaseDataSource(this._firestore);

  Future<CurrencyId?> createCurrency(CurrencyModel currencyModel) async {
    await _checkIfCurrencyAlreadyExisted(currencyModel);
    final doc = _firestore.currencyColl.doc();
    await doc.set(currencyModel.copyWith(id: doc.id));
    return doc.id;
  }

  Future<void> createAccount(AccountModel accountModel) async {
    await _throwExceptionIfAccountAlreadyCreated();
    await _firestore.accountDoc.set(accountModel);
  }

  Stream<AccountModel?> watchAccountData() {
    return _firestore.accountDoc.snapshots().map((event) => event.data());
  }

  Stream<Either<Failure, IList<CurrencyModel>>> watchAllCurrencies() {
    return _firestore.currencyColl
        .snapshots()
        .map((event) => right(event.docs.map((e) => e.data()!).toIList()));
  }

  Future<void> _throwExceptionIfAccountAlreadyCreated() async {
    final result = await _firestore.accountDoc.get();
    if (result.exists) {
      throw const Failure.restrictedTask(
          'Cannot create create account, because account is already existed');
    }
  }

  Future<void> _checkIfCurrencyAlreadyExisted(CurrencyModel currencyModel) async {
    final result = await _firestore.currencyColl
        .where('currency.code', isEqualTo: currencyModel.currency.code)
        .get();

    if (result.size > 0) {
      throw Failure.uniqueConstrant(
          'Currency with code: ${currencyModel.currency.code} is already existed',
          result.docs.first.data());
    }
  }
}
