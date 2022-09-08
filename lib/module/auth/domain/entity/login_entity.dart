import '../../data/model/login_model.dart';

class ResponseLogin extends LoginModel {
  ResponseLogin({
    required String accessToken,
    required String refreshToken,
  }) : super(accessToken: accessToken, refreshToken: refreshToken);
}
