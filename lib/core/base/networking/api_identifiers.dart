import '../../petlovers_core.dart';

/// identifiers for auth
abstract class EndpointIdentifiers {
  final _base = PetLoversEnvConfig.instance.baseUrl;

  String get baseUrl;
}

/// identifiers for auth
class AuthIdentifiers extends EndpointIdentifiers {
  @override
  String get baseUrl => '$_base/auth';
}
