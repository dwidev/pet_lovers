import 'package:flutter/cupertino.dart';
import 'package:pet_lovers/module/home/presentations/page/home_page.dart';

import '../../../../../core/petlovers_core.dart';
import '../../widgets/cart/cart_location_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

final _cartImageDummy = "https://berkeluarga.id/media/2020/11/whiskas.jpg";

class _CartPageState extends State<CartPage> {
  bool _tempCheck = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                  ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(PLThemeConstant.sizeS),
                        width: size.width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: _tempCheck,
                                  onChanged: (value) {
                                    setState(() {
                                      _tempCheck = value ?? false;
                                    });
                                  },
                                ),
                                const SizedBox(width: PLThemeConstant.sizeS),
                                Image.asset(store, width: 15),
                                const SizedBox(width: PLThemeConstant.sizeSS),
                                Text(
                                  "Dwi pet care",
                                  style: textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: PLThemeConstant.sizeM),
                            Container(
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: _tempCheck,
                                        onChanged: (value) {
                                          setState(() {
                                            _tempCheck = value ?? false;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                          width: PLThemeConstant.sizeS),
                                      Container(
                                        width: size.width / 3.5,
                                        height: size.width / 4,
                                        decoration: BoxDecoration(
                                          color:
                                              PLThemeConstant.unselectedColor,
                                          borderRadius:
                                              PLThemeConstant.cardBorderRadius,
                                          image: DecorationImage(
                                            image:
                                                NetworkImage(_cartImageDummy),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                          width: PLThemeConstant.sizeS),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Whiskas",
                                                style: textTheme.bodyText1,
                                              ),
                                              Row(
                                                children: [
                                                  const Text("varian : 5gr"),
                                                  IconButton(
                                                    padding: EdgeInsets.zero,
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.arrow_drop_down),
                                                    color: PLThemeConstant
                                                        .unselectedColor,
                                                    constraints:
                                                        const BoxConstraints(),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
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
                                                style: textTheme.bodyText1
                                                    ?.copyWith(
                                                  fontSize:
                                                      PLThemeConstant.sizeM,
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
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "43K",
                                    style: textTheme.headline1,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
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
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: _tempCheck,
                                    onChanged: (value) {},
                                  ),
                                  Text(
                                    "Semua",
                                    style: textTheme.bodyText1,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Voucher",
                                    style: textTheme.bodyText1,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Cari voucher anda/ Masukan kode",
                                      style: textTheme.bodyText2,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: PLThemeConstant.sizeM),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(TextSpan(children: [
                                TextSpan(
                                  text: "Total",
                                  style: textTheme.bodyText1,
                                ),
                                TextSpan(
                                  text: " Rp. 45000",
                                  style: textTheme.headline1?.copyWith(
                                      color: PLThemeConstant.yellowSecondary),
                                ),
                              ])),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Checkout (10)"))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
