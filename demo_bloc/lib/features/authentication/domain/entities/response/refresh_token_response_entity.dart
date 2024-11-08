import 'package:demo_bloc/features/shares/domain/entities/response/base_response_entity.dart';

class RefreshTokenResponseEntity extends BaseResponseEntity {
  final String accessToken;
  final String refreshToken;

  RefreshTokenResponseEntity(
      {required this.accessToken, required this.refreshToken});
}
