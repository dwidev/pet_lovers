import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final localStorageProvider = Provider.autoDispose<FlutterSecureStorage>(
  (ref) => const FlutterSecureStorage(),
  name: "localStorageProvider",
);

/// base class of local storage
abstract class BaseLocalStorage {
  /// define package for local storage
  final FlutterSecureStorage localStorage;

  BaseLocalStorage({
    required this.localStorage,
  });

  /// function for delete all data local storage
  Future<void> deleteAll() => localStorage.deleteAll();

  /// function checking avalable data by key
  Future<bool> checkingAvailableDataByKey(String key) async {
    final data = await localStorage.read(key: key) ?? '';
    return data.isNotEmpty;
  }
}
