// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:pet_lovers/core/navigator/navigator.dart';

import '../petlovers_core.dart';

class PetLoversScaffold extends StatelessWidget {
  const PetLoversScaffold({
    Key? key,
    this.title,
    this.leading,
    required this.body,
    this.onWillPop,
    this.backgroundColor,
    this.appBarBackgroundColor,
    this.appBarBottom,
  }) : super(key: key);

  final String? title;
  final Widget? leading;
  final Widget body;
  final Future<bool> Function()? onWillPop;
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;
  final PreferredSizeWidget? appBarBottom;

  bool _capPop(BuildContext context) {
    final route = ModalRoute.of(context);
    return route?.canPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: backgroundColor ?? PLThemeConstant.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: _capPop(context) ? false : true,
        backgroundColor: appBarBackgroundColor ?? PLThemeConstant.white,
        bottom: appBarBottom,
        leading: _capPop(context)
            ? IconButton(
                onPressed: () {
                  pop(context: context);
                },
                icon: Image.asset(
                  backPink,
                  width: PLThemeConstant.sizeL,
                ),
              )
            : null,
        title: Text(
          title ?? "",
          textAlign: TextAlign.start,
          style: _capPop(context) ? textTheme.headline1 : textTheme.bodyText2,
        ),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: body,
      ),
    );
  }
}
