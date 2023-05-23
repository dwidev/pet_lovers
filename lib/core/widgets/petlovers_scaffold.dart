// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:pet_lovers/core/navigator/navigator.dart';

import '../petlovers_core.dart';

class PetLoversScaffold extends StatelessWidget {
  const PetLoversScaffold({
    Key? key,
    this.title,
    this.actions,
    required this.body,
    this.onWillPop,
    this.backgroundColor,
    this.appBarBackgroundColor,
    this.appBarBottom,
    this.bottomFloating,
    this.withSearchBar = false,
    this.customeLeading,
    this.extendBodyBehindAppBar = false,
    this.toolbarHeight,
  }) : super(key: key);

  final String? title;
  final List<Widget>? actions;
  final Widget body;
  final Future<bool> Function()? onWillPop;
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;
  final PreferredSizeWidget? appBarBottom;
  final Widget? bottomFloating;
  final bool withSearchBar;
  final Widget? customeLeading;
  final bool extendBodyBehindAppBar;
  final double? toolbarHeight;

  bool _capPop(BuildContext context) {
    final route = ModalRoute.of(context);
    return route?.canPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        backgroundColor: backgroundColor ?? PLThemeConstant.white,
        appBar: AppBar(
          actions: actions,
          elevation: 0,
          centerTitle: _capPop(context) ? false : true,
          backgroundColor: appBarBackgroundColor ?? PLThemeConstant.white,
          bottom: appBarBottom,
          toolbarHeight: toolbarHeight,
          leading: _capPop(context)
              ? customeLeading ??
                  IconButton(
                    onPressed: () {
                      pop(context: context);
                    },
                    icon: Image.asset(
                      backPink,
                      width: PLThemeConstant.sizeM,
                    ),
                  )
              : customeLeading,
          title: withSearchBar
              ? InkWell(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: PetLoveSearchDelegate(),
                    );
                  },
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: PLThemeConstant.cardBorderRadius,
                        color: Colors.white,
                        boxShadow: [
                          PLThemeConstant.boxShadow,
                        ],
                      ),
                      child: Text(
                        "Telusuri apapun disini ....",
                        style: textTheme.bodySmall,
                      )),
                )
              : Text(
                  title ?? "",
                  textAlign: TextAlign.start,
                  style: _capPop(context)
                      ? textTheme.displayLarge?.copyWith(fontSize: 15)
                      : textTheme.bodyMedium,
                ),
        ),
        body: Stack(
          children: [
            body,
            Align(
              alignment: Alignment.bottomCenter,
              child: bottomFloating ?? const Offstage(),
            ),
          ],
        ),
      ),
    );
  }
}

class PetLoveSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Image.asset(
        backPink,
        width: PLThemeConstant.sizeS,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("Sukses");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text("suggesstion");
  }
}
