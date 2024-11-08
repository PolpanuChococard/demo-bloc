import 'package:demo_bloc/core/enums/gender_type.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/get_current_auth_response_entity.dart';
import 'package:demo_bloc/features/authentication/domain/entities/response/log_in_response_entity.dart';

class UserInfoEntity {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final GenderType gender;
  final String image;

  const UserInfoEntity({
    this.id = -1,
    this.username = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.gender = GenderType.none,
    this.image = '',
  });

  factory UserInfoEntity.fromLoginResponse(LogInResponseEntity loginResponse) =>
      UserInfoEntity(
          id: loginResponse.id,
          username: loginResponse.username,
          email: loginResponse.email,
          firstName: loginResponse.firstName,
          lastName: loginResponse.lastName,
          gender: loginResponse.gender,
          image: loginResponse.image);

  factory UserInfoEntity.fromGetCurrentAuthUserResponse(
          GetCurrentAuthResponseEntity getCurrentAuthResponse) =>
      UserInfoEntity(
          id: getCurrentAuthResponse.id,
          username: getCurrentAuthResponse.username,
          email: getCurrentAuthResponse.email,
          firstName: getCurrentAuthResponse.firstName,
          lastName: getCurrentAuthResponse.lastName,
          gender: getCurrentAuthResponse.gender,
          image: getCurrentAuthResponse.image);
}
