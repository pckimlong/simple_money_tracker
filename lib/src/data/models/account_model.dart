
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel {
  factory AccountModel() = _AccountModel;
	
  factory AccountModel.fromJson(Map<String, dynamic> json) =>
			_$AccountModelFromJson(json);
}
