import 'package:pet_lovers/module/auth/presentation/page/login_page.dart';

import 'core/petlovers_core.dart';
import 'module/home/presentations/page/home_page.dart';

class PetLoversApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: PetLoversEnvConfig.instance.appName,
      theme: baseTheme,
      home: const LoginPage(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child ?? const Offstage(),
        );
      },
    );
  }
}
