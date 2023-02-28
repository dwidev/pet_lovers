import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseUsecase<ResponseType, ParamsType> {
  Future<AsyncValue<ResponseType>> call(ParamsType params) async {
    try {
      return await processCall(params);
    } catch (e, s) {
      return AsyncValue.error(e, s);
    }
  }

  Future<AsyncValue<ResponseType>> processCall(ParamsType paramsType);
}

class NoParams {}
