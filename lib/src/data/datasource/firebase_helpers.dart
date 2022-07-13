import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:simple_money_tracker/src/data/models/account_model.dart';
import 'package:simple_money_tracker/src/data/models/user_model.dart';

import '../models/tran_model.dart';

const _userPath = "users";

const _accountPath = "accounts";

/// Default account, this might become dynamic in future. when we have
/// multi account support in one user
const _defaultAccountId = "default_account_id";
const _tranPath = "transactions";

/// default docId for storing simple data. because these data wont be large, to help in reducing
/// read count of firestore, I decided to make it as doc instead of it own collection
/// this doc should store as nested map on currency, category...
const _itemPath = "items";
const _categoryDocId = "categories_doc_id";
const _currencyDocId = "currencies_doc_id";

extension FirestoreX on FirebaseFirestore {
  String get _userDocId => kDebugMode
      ? "debug-doc-id"
      : FirebaseAuth.instance.currentUser?.uid ?? "debug-doc-id";

  DocumentReference<UserModel?> get userDoc {
    return collection(_userPath).doc(_userDocId).withConverter(
          fromFirestore: (d, _) => d.exists ? UserModel.fromJson(d.toMap()) : null,
          toFirestore: (o, _) => o?.toJson() as Map<String, dynamic>,
        );
  }

  /// App items
  CollectionReference<Map<String, dynamic>> get itemColl =>
      userDoc.collection(_itemPath);
  DocumentReference<Map<String, dynamic>> get currenciesDoc =>
      itemColl.doc(_currencyDocId);
  DocumentReference<Map<String, dynamic>> get categoriesDoc =>
      itemColl.doc(_categoryDocId);

  DocumentReference<AccountModel?> get accountDoc {
    return userDoc.collection(_accountPath).doc(_defaultAccountId).withConverter(
          fromFirestore: (d, _) => d.exists ? AccountModel.fromJson(d.toMap()) : null,
          toFirestore: (o, _) => o?.toJson() as Map<String, dynamic>,
        );
  }

  CollectionReference<TranModel?> get tranColl {
    return accountDoc.collection(_tranPath).withConverter(
          fromFirestore: (d, _) => d.exists ? TranModel.fromJson(d.toMap()) : null,
          toFirestore: (d, _) => d?.toJson() as Map<String, dynamic>,
        );
  }
}

extension FirebaseDocX on DocumentSnapshot {
  Map<String, dynamic> toMap() => data() as Map<String, dynamic>;
}
