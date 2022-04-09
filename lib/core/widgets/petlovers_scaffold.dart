import '../petlovers_core.dart';

class PetLoversScaffold extends StatelessWidget {
  const PetLoversScaffold({
    Key? key,
    this.title,
    this.leading,
    required this.body,
    this.onWillPop,
  }) : super(key: key);

  final String? title;
  final Widget? leading;
  final Widget body;
  final Future<bool> Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: PLThemeConstant.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: PLThemeConstant.white,
        leading: leading,
        title: Text(
          title ?? "",
          style: textTheme.bodyText2,
        ),
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: body,
      ),
    );
  }
}
