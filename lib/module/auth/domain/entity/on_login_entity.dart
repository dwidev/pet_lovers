import '../../../../core/base/entities/base_entity.dart';
import '../../data/model/login_model.dart';

class OnLoginEntity extends LoginModel implements BaseEntity {
  OnLoginEntity({required String username, required String password})
      : super(username: username, password: password);

  @override
  Map<String, dynamic> toBodyServer() {
    return {
      "username": username,
      "password": password,
    };
  }
}
