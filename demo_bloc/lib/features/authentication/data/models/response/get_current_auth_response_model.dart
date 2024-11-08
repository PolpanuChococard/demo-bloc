import 'package:demo_bloc/core/enums/gender_type.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/get_current_auth_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_current_auth_response_model.g.dart';

@JsonSerializable(converters: [GenderTypeConverter()])
class GetCurrentAuthResponseModel extends GetCurrentAuthResponseEntity {
  GetCurrentAuthResponseModel(
      {required super.id,
      required super.username,
      required super.email,
      required super.firstName,
      required super.lastName,
      required super.gender,
      required super.image});

  factory GetCurrentAuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentAuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentAuthResponseModelToJson(this);
}
