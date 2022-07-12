import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

typedef UserId = String;

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required UserId id,
    required String fullname,
    String? avartarUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
