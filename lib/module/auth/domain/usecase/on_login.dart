import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/usecase/base_usecase.dart';
import '../../../../core/petlovers_core.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../entity/on_login_entity.dart';
import '../repository/auth_repository.dart';

final usecaseOnLogin = Provider.autoDispose((ref) {
  return OnLogin(authRepository: ref.watch(authRepository));
});

class OnLogin extends BaseUsecase<bool, OnLoginEntity> {
  @protected
  final AuthRepository authRepository;

  OnLogin({required this.authRepository});

  @override
  Future<AsyncValue<bool>> processCall(OnLoginEntity params) async {
    final response = await authRepository.login(
      params.username,
      params.password,
    );

    return AsyncValue.data(response.isCreateAccount);
  }
}
