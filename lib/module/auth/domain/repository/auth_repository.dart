import 'package:pet_lovers/module/auth/data/model/login_model.dart';
import 'package:pet_lovers/module/auth/domain/enum/auth_status.dart';

abstract class AuthRepository {
  Future<LoginModel> login(String username, String password);

  Future<AuthenticationStatus> verifyAccessToken();
}
