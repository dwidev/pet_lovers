// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  final String username;
  final String password;
  final String accessToken;
  final String refreshToken;
  final bool isCreateAccount;

  LoginModel({
    this.username = '',
    this.password = '',
    this.accessToken = '',
    this.refreshToken = '',
    this.isCreateAccount = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'isCreateAccount': isCreateAccount,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
      isCreateAccount: map['isCreateAccount'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));
}
