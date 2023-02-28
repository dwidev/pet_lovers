import '../petlovers_core.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    Key? key,
    required this.title,
    this.index,
    this.noShadow = false,
    this.borderRadius,
    this.textTheme,
    this.backgroundColor,
  }) : super(key: key);

  final String title;
  final int? index;
  final bool noShadow;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textTheme;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final sTextTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return Card(
      elevation: noShadow ? 0 : theme.cardTheme.elevation,
      child: InkWell(
        onTap: () {
          print("Test");
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius ?? PLThemeConstant.cardBorderRadius,
            gradient: index == 0 ? PLThemeConstant.defaultGradient : null,
          ),
          child: Center(
            child: Text(
              title,
              style: textTheme ??
                  sTextTheme.bodySmall?.copyWith(
                    color: index == 0
                        ? Colors.white
                        : PLThemeConstant.pinkSecondary,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
