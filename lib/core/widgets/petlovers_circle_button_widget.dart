import '../petlovers_core.dart';

class PLButtonCircleWidget extends StatelessWidget {
  const PLButtonCircleWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.buttonSize = 55,
    this.backgroundColor = Colors.white,
    this.isGradientBackground = false,
    this.gradiendBackgroundColor = const [],
  }) : super(key: key);

  factory PLButtonCircleWidget.gradient({
    required String icon,
    required VoidCallback onPressed,
    required double buttonSize,
    required List<Color> gradiendBackgroundColor,
  }) {
    return PLButtonCircleWidget(
      icon: icon,
      isGradientBackground: true,
      gradiendBackgroundColor: gradiendBackgroundColor,
      onPressed: onPressed,
      buttonSize: buttonSize,
    );
  }

  final String icon;
  final double buttonSize;
  final VoidCallback onPressed;
  final Color backgroundColor;

  final bool isGradientBackground;
  final List<Color> gradiendBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isGradientBackground
            ? LinearGradient(colors: gradiendBackgroundColor)
            : null,
      ),
      // padding: EdgeInsets.all(buttonSize / 4),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: isGradientBackground ? Colors.transparent : backgroundColor,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(10),
        ),
        child: Image.asset(icon),
      ),
    );
  }
}
