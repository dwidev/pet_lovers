import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_lovers/module/auth/domain/enum/auth_status.dart';

import '../../../../core/base/usecase/base_usecase.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../repository/auth_repository.dart';

final verifyAccessTokenUsecase = Provider.autoDispose((ref) {
  return VerifyAccessToken(authRepository: ref.watch(authRepository));
});

class VerifyAccessToken extends BaseUsecase<AuthenticationStatus, NoParams> {
  final AuthRepository authRepository;

  VerifyAccessToken({
    required this.authRepository,
  });
  @override
  Future<AsyncValue<AuthenticationStatus>> processCall(
      NoParams paramsType) async {
    return AsyncData(await authRepository.verifyAccessToken());
  }
}
