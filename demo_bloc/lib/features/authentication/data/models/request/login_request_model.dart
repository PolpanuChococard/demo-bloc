import 'package:demo_bloc/features/authentication/domain/entities/request/log_in_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends LogInRequestEntity {
  const LoginRequestModel(
      {required super.username,
      required super.password,
      required super.expiresInMins});

  factory LoginRequestModel.fromEntity(LogInRequestEntity entity) {
    return LoginRequestModel(
        username: entity.username,
        password: entity.password,
        expiresInMins: entity.expiresInMins);
  }

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
