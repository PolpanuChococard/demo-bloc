import 'package:demo_bloc/features/authentication/domain/entities/request/refresh_token_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'refresh_token_request_model.g.dart';

@JsonSerializable()
class RefreshTokenRequestModel extends RefreshTokenRequestEntity {
  RefreshTokenRequestModel(
      {required super.refreshToken, required super.expiresInMins});

  factory RefreshTokenRequestModel.fromEntity(
      RefreshTokenRequestEntity entity) {
    return RefreshTokenRequestModel(
        refreshToken: entity.refreshToken, expiresInMins: entity.expiresInMins);
  }

  factory RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenRequestModelToJson(this);
}
