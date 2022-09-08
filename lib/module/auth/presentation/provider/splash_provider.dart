import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/usecase/base_usecase.dart';
import '../../domain/enum/auth_status.dart';
import '../../domain/usecase/verify_access_token.dart';

final splashProvider = StateNotifierProvider.autoDispose<SplashProvider,
    AsyncValue<AuthenticationStatus>>((ref) {
  final verifyAccTokenUsecase = ref.watch(verifyAccessTokenUsecase);
  return SplashProvider(verifyAccessToken: verifyAccTokenUsecase);
});

class SplashProvider extends StateNotifier<AsyncValue<AuthenticationStatus>> {
  final VerifyAccessToken verifyAccessToken;

  SplashProvider({required this.verifyAccessToken})
      : super(
          const AsyncValue.data(AuthenticationStatus.unauthentication),
        );

  /// do checking access token
  Future<void> doCheckingAccessToken() async {
    state = const AsyncLoading();
    final response = await verifyAccessToken(NoParams());
    response.whenOrNull(
      data: (data) {
        state = AsyncData(data);
      },
      error: (e, s) {
        state = AsyncError(e, stackTrace: s);
      },
    );
  }
}
