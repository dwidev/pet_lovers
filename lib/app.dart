import 'core/petlovers_core.dart';
import 'environment/env.dart';
import 'module/home/home_page.dart';

class PetLoversApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: baseTheme,
      home: const HomePage(),
    );
  }
}
