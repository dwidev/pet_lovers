import '../petlovers_core.dart';

class CustomeButtonWidget extends StatelessWidget {
  const CustomeButtonWidget({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        gradient: PLThemeConstant.defaultGradient,
        borderRadius: BorderRadius.circular(PLThemeConstant.radius),
        boxShadow: const [PLThemeConstant.boxShadow],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
