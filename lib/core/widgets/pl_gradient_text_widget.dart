import '../petlovers_core.dart';

class PLGradientText extends StatelessWidget {
  const PLGradientText(
    this.text, {
    required this.gradient,
    this.disable = false,
    this.style,
  });

  final bool disable;
  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    if (disable) {
      return Text(text, style: style);
    }

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
