import '../../../../../core/petlovers_core.dart';

class StockWidget extends StatelessWidget {
  const StockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        PLButtonCircleWidget.gradient(
          buttonSize: 20,
          icon: Icons.remove,
          onPressed: () {},
        ),
        const SizedBox(
          width: PLThemeConstant.sizeSS,
        ),
        Text(
          "10",
          style: textTheme.bodyLarge?.copyWith(
            fontSize: PLThemeConstant.sizeM,
          ),
        ),
        const SizedBox(
          width: PLThemeConstant.sizeSS,
        ),
        PLButtonCircleWidget.gradient(
          buttonSize: 20,
          icon: Icons.add,
          onPressed: null,
        ),
      ],
    );
  }
}
