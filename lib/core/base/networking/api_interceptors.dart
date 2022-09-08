import 'package:dio/dio.dart';

import '../local_storage/token_storage.dart';

/// for api interceptors
class ApiInterceptors extends Interceptor {
  final TokenStorage tokenStorage;

  ApiInterceptors({required this.tokenStorage});

  @override
  Future<void> onRequest(RequestOptions o, RequestInterceptorHandler h) async {
    final accessToken = await tokenStorage.getAccessToken;

    if (accessToken.isNotEmpty) {
      o.headers['Authorizations'] = accessToken;
    } else {
      o.headers.remove('Authorizations');
    }

    print("request base url : ${o.baseUrl}");
    print("request path : ${o.path}");
    print("request headers : ${o.headers}");

    super.onRequest(o, h);
  }

  @override
  void onResponse(Response r, ResponseInterceptorHandler h) {
    print("response data  : ${r.data}");

    super.onResponse(r, h);
  }
}
