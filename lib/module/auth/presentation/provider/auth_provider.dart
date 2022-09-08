import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/on_login_entity.dart';
import '../../domain/usecase/on_login.dart';

final authProvider =
    StateNotifierProvider.autoDispose<AuthProvider, AsyncValue<bool>>((ref) {
  return AuthProvider(onLogin: ref.watch(usecaseOnLogin));
});

/// auth provider
class AuthProvider extends StateNotifier<AsyncValue<bool>> {
  final OnLogin onLogin;

  AuthProvider({
    required this.onLogin,
  }) : super(const AsyncValue.data(false));

  Future<void> doLogin(String username, String password) async {
    state = const AsyncLoading();
    final params = OnLoginEntity(username: username, password: password);
    state = await onLogin(params);
  }
}
