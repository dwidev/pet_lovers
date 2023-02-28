import '../../../../../core/petlovers_core.dart';

class CartLocationWidget extends StatelessWidget {
  const CartLocationWidget({
    Key? key,
    required this.location,
  }) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.only(left: PLThemeConstant.sizeM),
      width: size.width,
      height: PLThemeConstant.sizeL,
      color: Colors.white,
      child: Row(
        children: [
          Image.asset(locationGrey, width: PLThemeConstant.sizeMS),
          const SizedBox(width: PLThemeConstant.sizeSS),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: "Dikirim ke"),
                TextSpan(
                  text: " $location",
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
