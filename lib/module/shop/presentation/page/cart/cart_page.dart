import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../core/petlovers_core.dart';
import '../../widgets/cart/cart_location_widget.dart';

part '../../widgets/cart/cart_checkout_info_widget.dart';
part '../../widgets/cart/cart_item_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

const _cartImageDummy = "https://berkeluarga.id/media/2020/11/whiskas.jpg";

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PetLoversScaffold(
      backgroundColor: PLThemeConstant.lightPrimary,
      title: "Keranjang saya",
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            const CartLocationWidget(location: "Rumah"),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return CartItem(index: index);
                          },
                        ),
                      ),
                      const SizedBox(height: CartCheckoutInfo.height),
                    ],
                  ),
                  const CartCheckoutInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
