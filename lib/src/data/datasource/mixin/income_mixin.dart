import 'package:simple_money_tracker/src/data/datasource/firebase_datasource.dart';
import 'package:simple_money_tracker/src/data/models/tran_model.dart';

mixin IncomeMixin on FirebaseDataSource {
  Future<TranModel?> createIncomeTranOffice(Income model) async {
    return null;
  }

  Future<TranModel?> createIncomeTranOnline(Income model) async {
    return null;
  }
}
