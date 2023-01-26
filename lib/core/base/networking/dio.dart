import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../local_storage/token_storage.dart';
import 'api_identifiers.dart';
import 'api_interceptors.dart';

/// params of [_baseDio]
class MyDioParams {
  final EndpointIdentifiers identifiers;

  MyDioParams(this.identifiers);
}

/// dio instance api
final _baseDio = Provider.family<Dio, MyDioParams>((ref, params) {
  final cancleToken = CancelToken();
  ref.onDispose(() => cancleToken.cancel());

  final options = BaseOptions(baseUrl: params.identifiers.baseUrl);
  final dio = Dio(options);

  final apiInterceptors = ApiInterceptors(
    tokenStorage: ref.read(tokenStorage),
  );

  dio.interceptors.add(apiInterceptors);
  return dio;
}, name: "_baseDio");

/// dio for auth api
final authHttpRequest = Provider.autoDispose<Dio>((ref) {
  final params = MyDioParams(AuthIdentifiers());
  return ref.watch(_baseDio(params));
}, name: "authHttpRequest");

/// dio for master data api
final masterDataHttpRequest = Provider.autoDispose<Dio>((ref) {
  final params = MyDioParams(MasterDataIdentifiers());
  return ref.watch(_baseDio(params));
}, name: "masterDataHttpRequest");
