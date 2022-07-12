import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:simple_money_tracker/src/data/models/account_model.dart';
import 'package:simple_money_tracker/src/data/models/currency_model.dart';

const _userPath = "users";
const _accountPath = "accounts";
const _currencyPath = "currencies";

extension FirestoreX on FirebaseFirestore {
  String get _userDocId => kDebugMode
      ? "debug-doc-id"
      : FirebaseAuth.instance.currentUser?.uid ?? "debug-doc-id";

  DocumentReference<AccountModel?> get accountDoc {
    return collection(_accountPath).doc(_userDocId).withConverter(
          fromFirestore: (d, _) => d.exists ? AccountModel.fromJson(d.toMap()) : null,
          toFirestore: (o, _) => o?.toJson() as Map<String, dynamic>,
        );
  }

  CollectionReference<CurrencyModel?> get currencyColl {
    return accountDoc.collection(_currencyPath).withConverter(
          fromFirestore: (d, _) => d.exists ? CurrencyModel.fromJson(d.toMap()) : null,
          toFirestore: (o, _) => o?.toJson() as Map<String, dynamic>,
        );
  }
}

extension FirebaseDocX on DocumentSnapshot {
  Map<String, dynamic> toMap() => data() as Map<String, dynamic>;
}
