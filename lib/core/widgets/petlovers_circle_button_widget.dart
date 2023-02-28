import '../petlovers_core.dart';

class PLButtonCircleWidget extends StatelessWidget {
  static const _defaultButtonSize = 55.0;

  const PLButtonCircleWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.buttonSize = _defaultButtonSize,
    this.backgroundColor = Colors.white,
    this.isGradientBackground = false,
    this.gradiendBackgroundColor = const [],
    this.iconColor = Colors.white,
    this.noShadow = false,
  }) : super(key: key);

  factory PLButtonCircleWidget.gradient({
    required dynamic icon,
    required VoidCallback? onPressed,
    double buttonSize = _defaultButtonSize,
    List<Color>? gradiendBackgroundColor,
  }) {
    return PLButtonCircleWidget(
      icon: icon,
      isGradientBackground: true,
      gradiendBackgroundColor: gradiendBackgroundColor ??
          [
            PLThemeConstant.pinkSecondary,
            PLThemeConstant.pinkPrimary,
          ],
      onPressed: onPressed,
      buttonSize: buttonSize,
    );
  }

  final dynamic icon;

  /// if [icon] is type [Image] icon color not effect, this only for
  /// for [icon] is type [IconData]
  final Color iconColor;
  final double buttonSize;
  final VoidCallback? onPressed;
  final Color backgroundColor;

  final bool isGradientBackground;
  final List<Color> gradiendBackgroundColor;
  final bool noShadow;

  @override
  Widget build(BuildContext context) {
    final primary = isGradientBackground ? Colors.transparent : backgroundColor;

    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isGradientBackground && onPressed != null
            ? LinearGradient(colors: gradiendBackgroundColor)
            : null,
        boxShadow: noShadow
            ? null
            : const [
                BoxShadow(
                  color: PLThemeConstant.unselectedColor,
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(-2, 2),
                )
              ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          primary: primary,
          shape: const CircleBorder(),
          padding: EdgeInsets.all(buttonSize / 4),
        ),
        child: icon is IconData
            ? Icon(
                icon as IconData,
                size: buttonSize / 2,
                color: iconColor,
              )
            : Image.asset(icon),
      ),
    );
  }
}
