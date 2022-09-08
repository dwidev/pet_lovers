import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/local_storage/token_storage.dart';
import '../../../../core/base/networking/dio.dart';
import '../../domain/enum/auth_status.dart';
import '../../domain/repository/auth_repository.dart';
import '../model/login_model.dart';

final authRepository = Provider.autoDispose<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    authHttpRequest: ref.watch(authHttpRequest),
    tokenStorage: ref.read(tokenStorage),
  );
});

/// class for handle authentication of user
class AuthRepositoryImpl implements AuthRepository {
  final Dio authHttpRequest;
  final TokenStorage tokenStorage;

  AuthRepositoryImpl({
    required this.authHttpRequest,
    required this.tokenStorage,
  });

  /// function for login api
  @override
  Future<LoginModel> login(String username, String password) async {
    final data = {"username": username, "password": password};
    final response = await authHttpRequest.post('/login', data: data);
    final authModel = LoginModel.fromMap(response.data);
    await tokenStorage.storeToken(authModel);
    return authModel;
  }

  /// function for check access token
  @override
  Future<AuthenticationStatus> verifyAccessToken() async {
    final accessToken = await tokenStorage.getAccessToken;

    if (accessToken.isNotEmpty) {
      return Future.delayed(
        const Duration(seconds: 3),
        () => AuthenticationStatus.authentication,
      );
    }

    return Future.delayed(
      const Duration(seconds: 3),
      () => AuthenticationStatus.unauthentication,
    );
  }
}
