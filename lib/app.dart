import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_lovers/module/home/presentations/page/home_page.dart';

import 'core/base/providers/logger_provider.dart';
import 'core/petlovers_core.dart';

class PetLoversApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [ProviderLoggers()],
      child: MaterialApp(
        title: PetLoversEnvConfig.instance.appName,
        theme: baseTheme,
        home: const HomePage(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child ?? const Offstage(),
          );
        },
      ),
    );
  }
}
