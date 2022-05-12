import 'package:pet_lovers/core/petlovers_core.dart';

/// for navigate to next page
Future<void> push({required BuildContext context, required Widget page}) {
  final route = MaterialPageRoute(builder: (context) => page);
  return Navigator.push<void>(context, route);
}

/// for navigate to back page
/// [count] is how many times to back page.
void pop({required BuildContext context, int count = 1}) {
  if (count <= 1) {
    return Navigator.pop(context);
  }

  var c = count;
  Navigator.popUntil(context, (route) => c-- <= count);
}
