import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_money_tracker/src/data/models/user_model.dart';
import 'firebase_helpers.dart';
import '../../../exports.dart';

final datasourceProvider = Provider<FirebaseDataSource>((ref) {
  return FirebaseDataSource(ref.watch(firestoreProvider));
});

class FirebaseDataSource {
  final FirebaseFirestore _firestore;

  FirebaseDataSource(this._firestore);

  Stream<UserModel?> watchData() {
    return _firestore.userDoc.snapshots().map((event) => event.data());
  }
}
