import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLoggers extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      print("ON ADD PROVIDER");
      print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "initial value": "$value"
}''');
    }
    super.didAddProvider(provider, value, container);
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (kDebugMode) {
      print("ON UPDATE PROVIDER");
      print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
    }
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    if (kDebugMode) {
      print("ON DISPOSE PROVIDER");
      print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
}''');
    }

    super.didDisposeProvider(provider, containers);
  }
}
