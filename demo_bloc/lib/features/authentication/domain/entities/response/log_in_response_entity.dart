import 'package:demo_bloc/core/enums/gender_type.dart';
import 'package:demo_bloc/features/shares/domain/entities/response/base_response_entity.dart';

class LogInResponseEntity extends BaseResponseEntity {
  LogInResponseEntity(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.image,
      required this.accessToken,
      required this.refreshToken});

  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final GenderType gender;
  final String image;
  final String accessToken;
  final String refreshToken;
}
