part of '../../page/cart/cart_page.dart';

class CartCheckoutInfo extends StatelessWidget {
  static const height = 130.0;

  const CartCheckoutInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: PLThemeConstant.sizeS,
          horizontal: PLThemeConstant.sizeM,
        ),
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              color: PLThemeConstant.unselectedColor,
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text(
                      "Semua",
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Voucher",
                      style: textTheme.bodyLarge,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Cari voucher anda/ Masukan kode",
                        style: textTheme.bodyMedium,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: PLThemeConstant.sizeM),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "Total",
                    style: textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: " Rp. 45000",
                    style: textTheme.displayLarge
                        ?.copyWith(color: PLThemeConstant.yellowSecondary),
                  ),
                ])),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Checkout (10)"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
