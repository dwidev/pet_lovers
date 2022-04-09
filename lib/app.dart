import 'package:pet_lovers/views/home_page.dart';
import 'package:pet_lovers/views/splash_page.dart';

import 'core/petlovers_core.dart';

class PetLoversApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Lovers',
      theme: baseTheme,
      home: const HomePage(),
    );
  }
}
