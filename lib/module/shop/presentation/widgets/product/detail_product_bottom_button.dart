import 'package:flutter/cupertino.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PLThemeConstant.sizeML,
        vertical: PLThemeConstant.sizeM,
      ),
      color: Colors.white,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(CupertinoIcons.chat_bubble_2),
                Text("chat")
              ],
            ),
          ),
          const SizedBox(width: 15),
          InkWell(
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.storefront_outlined),
                Text("Toko"),
              ],
            ),
          ),
          const SizedBox(width: PLThemeConstant.sizeM),
          OutlinedButton(
            onPressed: () {},
            child: const Text("Tambah ke Troli"),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Beli sekarang"),
            ),
          )
        ],
      ),
    );
  }
}
