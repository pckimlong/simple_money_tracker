import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:simple_money_tracker/src/data/models/user_model.dart';

const _userPath = "users";

extension FirestoreX on FirebaseFirestore {
  DocumentReference<UserModel?> get userDoc {
    final docId = kDebugMode
        ? "debug-doc-id"
        : FirebaseAuth.instance.currentUser?.uid ?? "debug-doc-id";

    return collection(_userPath).doc(docId).withConverter(
          fromFirestore: (d, _) => d.exists ? UserModel.fromJson(d.toMap()) : null,
          toFirestore: (o, _) => o?.toJson() as Map<String, dynamic>,
        );
  }
}

extension FirebaseDocX on DocumentSnapshot {
  Map<String, dynamic> toMap() => data() as Map<String, dynamic>;
}
