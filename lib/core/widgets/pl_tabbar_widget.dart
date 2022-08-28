import '../petlovers_core.dart';

typedef PLTabBarCallback = Function(int index);

class PLTabBarWidget extends StatelessWidget {
  const PLTabBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.listTabBar,
    required this.onPressed,
  }) : super(key: key);

  final int selectedIndex;
  final List<String> listTabBar;
  final PLTabBarCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return Row(
      children: [
        ...listTabBar
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.only(right: 5),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          onPressed(key);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: PLGradientText(
                            listTabBar[key],
                            disable: selectedIndex != key,
                            style: textTheme.headline1?.copyWith(
                                color: selectedIndex != key
                                    ? PLThemeConstant.unselectedColor
                                    : null),
                            gradient: PLThemeConstant.defaultGradient,
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
            .values
            .toList(),
      ],
    );
  }
}
