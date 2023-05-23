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

/// To navigate to next page (Scaffold), then remove all previous page from stack.
Future<void> pushAndRemoveAll({
  required BuildContext context,
  required Widget page,
}) async {
  final route = MaterialPageRoute(builder: (_) => page);
  return Navigator.pushAndRemoveUntil<void>(context, route, (route) => false);
}

/// for navigate to next page with opacity animation
Future<void> pushWithOpacity({
  required BuildContext context,
  required Widget page,
}) async {
  return Navigator.push<void>(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return page;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}
