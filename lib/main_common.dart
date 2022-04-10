import 'app.dart';
import 'core/petlovers_core.dart';
import 'environment/env.dart';

void mainCommon(PetLoversEnvironment env) {
  configureAppConfigs(env);

  runApp(PetLoversApp());
}
