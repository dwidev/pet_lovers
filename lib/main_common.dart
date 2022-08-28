import 'app.dart';
import 'core/petlovers_core.dart';

void mainCommon(PetLoversEnvironment env) {
  PetLoversEnvConfig.config(env);
  runApp(PetLoversApp());
}
