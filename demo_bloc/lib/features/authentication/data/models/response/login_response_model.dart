import 'package:demo_bloc/core/enums/gender_type.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/log_in_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(converters: [GenderTypeConverter()])
class LoginResponseModel extends LogInResponseEntity {
  LoginResponseModel(
      {required super.id,
      required super.username,
      required super.email,
      required super.firstName,
      required super.lastName,
      required super.gender,
      required super.image,
      required super.accessToken,
      required super.refreshToken});

  factory LoginResponseModel.fromEntity(LogInResponseEntity entity) {
    return LoginResponseModel(
        id: entity.id,
        username: entity.username,
        email: entity.email,
        firstName: entity.firstName,
        lastName: entity.lastName,
        gender: entity.gender,
        image: entity.image,
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken);
  }

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
