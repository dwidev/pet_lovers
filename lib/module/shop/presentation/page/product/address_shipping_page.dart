import 'package:pet_lovers/core/navigator/navigator.dart';
import 'package:pet_lovers/module/shop/presentation/page/product/pick_address_page.dart';

import '../../../../../core/petlovers_core.dart';
import '../../widgets/shipping_address/shipping_address_tile.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  @override
  Widget build(BuildContext context) {
    return PetLoversScaffold(
      backgroundColor: PLThemeConstant.lightPrimary,
      title: "Alamat pengiriman",
      actions: [
        InkWell(
          onTap: () {
            pushWithOpacity(context: context, page: const PickAddressPage());
          },
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.add,
              color: PLThemeConstant.pinkSecondary,
            ),
          ),
        )
      ],
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ShippingAddressTile(
              isSelected: index == 0,
            );
          },
        ),
      ),
      bottomFloating: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
          top: 10,
          bottom: 30,
        ),
        width: getSize(context).width,
        child: ElevatedButton(
          onPressed: () {
            pop(context: context);
          },
          child: const Text("Simpan"),
        ),
      ),
    );
  }
}
