import 'package:demo_bloc/features/authentication/domain/entities/response/refresh_token_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'refresh_token_response_model.g.dart';

@JsonSerializable()
class RefreshTokenResponseModel extends RefreshTokenResponseEntity {
  RefreshTokenResponseModel(
      {required super.accessToken, required super.refreshToken});

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseModelToJson(this);
}
