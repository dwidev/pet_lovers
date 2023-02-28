import '../../../../../core/petlovers_core.dart';

class DetailProductShopBottomButtonWidget extends StatelessWidget {
  const DetailProductShopBottomButtonWidget({
    Key? key,
    required this.onPressedCart,
    required this.onPressedCheckout,
  }) : super(key: key);

  final VoidCallback onPressedCart;
  final VoidCallback onPressedCheckout;

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return Container(
      color: Colors.white,
      child: Row(
        children: [
          PLButtonCircleWidget(
            buttonSize: 45,
            icon: addToCart,
            onPressed: onPressedCart,
          ),
          const SizedBox(width: PLThemeConstant.sizeM),
          Expanded(
            child: CustomeButtonWidget(
              onPressed: onPressedCheckout,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "53k",
                      style: textTheme.headline1?.copyWith(
                        color: Colors.yellow,
                        fontSize: 30,
                      ),
                    ),
                    TextSpan(
                      text: " Bayar",
                      style: textTheme.headline1?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
