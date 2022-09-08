import '../core/petlovers_core.dart';

/// enum for defince use environtment
enum PetLoversEnvironment { production, uat, staging }

/// Perlovers environtment config for setup like address of endpoint, app name & etc.
class PetLoversEnvConfig {
  /// for base url
  final String baseUrl;

  /// for app name
  final String appName;

  /// for aditional value
  final Map<String, dynamic> additionalValue;

  /// for create instance
  factory PetLoversEnvConfig({
    required String baseUrl,
    Map<String, dynamic> additionalValue = const {},
    required String appName,
  }) {
    _instance = PetLoversEnvConfig._internal(
      baseUrl: baseUrl,
      additionalValue: additionalValue,
      appName: appName,
    );
    return instance;
  }

  /// private contuctor
  PetLoversEnvConfig._internal({
    required this.baseUrl,
    required this.additionalValue,
    required this.appName,
  });

  /// for instance value
  static PetLoversEnvConfig? _instance;

  /// for get instance value
  static PetLoversEnvConfig get instance {
    final newInstance = _instance;
    if (newInstance == null) {
      throw FlutterError("_instance of PetLoversEnvConfig cannot be null");
    }

    return newInstance;
  }

  /// for create environtment configuration based [PetLoversEnvironment]
  factory PetLoversEnvConfig.config(PetLoversEnvironment environment) {
    print("ENV : $environment");

    /// config environtment production value
    if (environment == PetLoversEnvironment.production) {
      return PetLoversEnvConfig(
        baseUrl: "https://api-prod.petlove.com/petlove/api/v1",
        appName: "PetLovers",
      );
    }

    /// config environtment staging value
    if (environment == PetLoversEnvironment.staging) {
      return PetLoversEnvConfig(
        baseUrl: "https://api-staging.petlove.com/petlove/api/v1",
        appName: "PetLovers staging",
      );
    }

    /// config environtment uat value
    if (environment == PetLoversEnvironment.uat) {
      return PetLoversEnvConfig(
        baseUrl: "http://localhost:3000/petlove/api/v1",
        appName: "PetLovers UAT",
      );
    }

    throw FlutterError("$environment not match in [PetLoversEnvironment]");
  }
}
