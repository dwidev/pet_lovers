import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../module/auth/data/model/login_model.dart';
import 'base_storage.dart';

/// instance token storage with provider
final tokenStorage = Provider.autoDispose<TokenStorage>(
  (ref) => TokenStorage(localStorage: ref.read(localStorageProvider)),
  name: "tokenStorage",
);

/// class for handle token at local storage
class TokenStorage extends BaseLocalStorage {
  TokenStorage({required FlutterSecureStorage localStorage})
      : super(localStorage: localStorage);

  static const accessTokenKey = "access_token_key";
  static const refreshTokenKey = "refresh_token_key";

  /// getters for get access token from storage
  Future<String> get getAccessToken async =>
      await localStorage.read(key: accessTokenKey) ?? '';

  /// getters for get refresh token from storage
  Future<String> get getRefreshToken async =>
      await localStorage.read(key: refreshTokenKey) ?? '';

  /// function for store token after login / refresh token to local storage
  Future<void> storeToken(LoginModel model) async {
    await Future.wait([
      localStorage.write(key: accessTokenKey, value: model.accessToken),
      localStorage.write(key: refreshTokenKey, value: model.refreshToken),
    ]);
  }
}
