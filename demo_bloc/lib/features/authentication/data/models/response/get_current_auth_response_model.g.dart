// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentAuthResponseModel _$GetCurrentAuthResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCurrentAuthResponseModel(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      gender: const GenderTypeConverter().fromJson(json['gender'] as String),
      image: json['image'] as String,
    );

Map<String, dynamic> _$GetCurrentAuthResponseModelToJson(
        GetCurrentAuthResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': const GenderTypeConverter().toJson(instance.gender),
      'image': instance.image,
    };
