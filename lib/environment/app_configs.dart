part of 'env.dart';

late String baseUrl;
late String appName;

/// for configure app config by environment
void configureAppConfigs(PetLoversEnvironment env) {
  switch (env) {
    case PetLoversEnvironment.production:
      appName = "Pet Lovers";
      break;
    case PetLoversEnvironment.staging:
      appName = "Pet Lovers Staging";
      break;
    case PetLoversEnvironment.uat:
      appName = "Pet Lovers UAT";
      break;
    default:
      throw UnimplementedError("No environment implementation");
  }
}
