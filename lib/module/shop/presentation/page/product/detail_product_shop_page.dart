import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pet_lovers/core/widgets/voucher_widget.dart';
import 'package:pet_lovers/module/shop/presentation/address_page/address_shipping_page.dart';
import 'package:pet_lovers/module/shop/presentation/page/product/rating_product_page.dart';
import 'package:pet_lovers/module/shop/presentation/store/store_shop_page.dart';

import '../../../../../core/navigator/navigator.dart';
import '../../../../../core/petlovers_core.dart';
import '../../../../../core/widgets/badge_widget.dart';
import '../../../../../core/widgets/modal_bottomsheet.dart';
import '../../../../home/presentations/page/home_page.dart';
import '../../widgets/product/detail_product_bottom_button.dart';
import '../../widgets/product/rating_comment_widget.dart';
import '../../widgets/shop_tile_widget.dart';
import '../main/discover_shop_page.dart';

const dummyShop =
    "https://st3.depositphotos.com/1063437/18549/i/450/depositphotos_185496108-stock-photo-whiskas-cat-food-products-of.jpg";

class DetailProductShop extends StatefulWidget {
  const DetailProductShop({super.key});

  @override
  State<DetailProductShop> createState() => _DetailProductShopState();
}

class _DetailProductShopState extends State<DetailProductShop> {
  late PageController pageController;
  int indexPage = 1;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);

    return PetLoversScaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: PLThemeConstant.lightPrimary,
      appBarBackgroundColor: Colors.transparent,
      bottomFloating: DetailProductShopBottomButtonWidget(
        onPressedCart: () {},
        onPressedCheckout: () {},
      ),
      toolbarHeight: kToolbarHeight + 20,
      customeLeading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20).copyWith(left: 10),
        child: PLButtonCircleWidget(
          backgroundColor: Colors.black.withOpacity(0.5),
          noShadow: true,
          buttonSize: 35,
          icon: CupertinoIcons.back,
          onPressed: () {
            pop(context: context);
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10).copyWith(right: 10),
          child: PLButtonCircleWidget(
            backgroundColor: Colors.black.withOpacity(0.5),
            noShadow: true,
            buttonSize: 35,
            icon: Icons.reply_rounded,
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10).copyWith(right: 10),
          child: PLButtonCircleWidget(
            backgroundColor: Colors.black.withOpacity(0.5),
            noShadow: true,
            buttonSize: 35,
            icon: CupertinoIcons.heart_fill,
            iconColor: Colors.red,
            onPressed: () {},
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height / 2.2,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: dummyProduct.length,
                      onPageChanged: (value) {
                        setState(() {
                          indexPage = value + 1;
                        });
                      },
                      itemBuilder: (context, index) {
                        final image = dummyProduct[index];
                        return Container(
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: PLThemeConstant.sizeM,
                    right: PLThemeConstant.sizeM,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        "$indexPage/${dummyProduct.length}",
                        style: textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: size.width,
                color: PLThemeConstant.pinkDarkPrimary,
                child: Stack(
                  children: [
                    Positioned(
                      right: size.width / 4.5,
                      child: Container(
                        height: 60,
                        child: Image.asset(
                          thunderOverlay,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: PLThemeConstant.sizeS,
                        vertical: PLThemeConstant.sizeSS + 2,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Rp40.000",
                                style: textTheme.bodyLarge?.copyWith(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Rp50.000",
                                    style: textTheme.bodySmall?.copyWith(
                                      color: Colors.white,
                                      decoration: TextDecoration.lineThrough,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(
                                      width: PLThemeConstant.sizeS - 3),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    color: Colors.black.withOpacity(0.29),
                                    child: Text(
                                      "10%",
                                      style: textTheme.bodySmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Flash sale ",
                                      style: textTheme.bodySmall?.copyWith(
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Icon(
                                        Icons.bolt_rounded,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Berakhir dalam",
                                      style: textTheme.bodySmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: PLThemeConstant.sizeSS),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                      "00",
                                      style: textTheme.bodySmall?.copyWith(
                                        color: PLThemeConstant.blackPrimary,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: textTheme.bodySmall?.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                      "54",
                                      style: textTheme.bodySmall?.copyWith(
                                        color: PLThemeConstant.blackPrimary,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ":",
                                    style: textTheme.bodySmall?.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                            horizontal: 5)
                                        .copyWith(right: 0),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                      "05",
                                      style: textTheme.bodySmall?.copyWith(
                                        color: PLThemeConstant.blackPrimary,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "🔥 Paling sering dibeli dalam kategori makanan",
                    //   style: textTheme.bodyMedium?.copyWith(
                    //     color: Colors.red[600],
                    //   ),
                    // ),
                    const SizedBox(height: PLThemeConstant.sizeSS),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "Whiskas",
                            style:
                                textTheme.displayLarge?.copyWith(fontSize: 25),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        const SizedBox(width: PLThemeConstant.sizeS),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: PLThemeConstant.yellowPrimary,
                                size: 15,
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "4.5",
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "/5",
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: PLThemeConstant.unselectedColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: PLThemeConstant.sizeSS),
                              const Text("|"),
                              const SizedBox(width: PLThemeConstant.sizeSS),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "1809",
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " terjual",
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: PLThemeConstant.unselectedColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              separator,
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: PLThemeConstant.sizeSS),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Opsi",
                          style: textTheme.bodyLarge,
                          overflow: TextOverflow.clip,
                        ),
                        const SizedBox(width: PLThemeConstant.sizeS),
                        InkWell(
                          onTap: () => showBaseModal(
                            context,
                            (context) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Opsi",
                                    style: textTheme.bodyLarge,
                                    overflow: TextOverflow.clip,
                                  ),
                                  const SizedBox(height: PLThemeConstant.sizeS),
                                  Image.network(
                                    "https://s4.bukalapak.com/img/96923196592/s-463-463/data.jpeg.webp",
                                    fit: BoxFit.cover,
                                    width: 80,
                                  ),
                                  const SizedBox(height: PLThemeConstant.sizeS),
                                  Wrap(
                                    children: List.generate(
                                      3,
                                      (index) => Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: OutlinedButton(
                                          onPressed: () {},
                                          child: const Text("90 gram"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: PLThemeConstant.sizeS),
                                  Container(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        pop(context: context);
                                      },
                                      child: const Text("Konfirmasi"),
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                          child: Row(
                            children: [
                              Text(
                                "900gr",
                                style: textTheme.bodySmall,
                                overflow: TextOverflow.clip,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: PLThemeConstant.blackPrimary,
                                size: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: PLThemeConstant.sizeS),
                    Wrap(
                      children: List.generate(
                        3,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: EdgeInsets.zero,
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: index == 0
                                    ? PLThemeConstant.unselectedColor
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(2),
                              image: const DecorationImage(
                                image: NetworkImage(dummyShop),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              separator,
              Container(
                width: size.width,
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: PLThemeConstant.sizeSS),
                    Text(
                      "Deskripsi",
                      style: textTheme.bodyLarge,
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(height: PLThemeConstant.sizeM),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, \n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
                      style: textTheme.bodyMedium,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
              separator,
              Container(
                width: size.width,
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: PLThemeConstant.sizeSS),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pengiriman",
                          style: textTheme.bodyLarge,
                          overflow: TextOverflow.clip,
                        ),
                        InkWell(
                          onTap: () => showBaseModal(
                            context,
                            customePadding: EdgeInsets.zero,
                            (context) {
                              return Container(
                                width: getSize(context).width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15)
                                          .copyWith(bottom: 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Pengiriman",
                                            style: textTheme.bodyLarge,
                                            overflow: TextOverflow.clip,
                                          ),
                                          const SizedBox(
                                              height: PLThemeConstant.sizeM),
                                          Row(
                                            children: [
                                              const Icon(
                                                CupertinoIcons.cube_box,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 15),
                                              Text(
                                                "Dikirim dari Jakarta Pusat",
                                                style: textTheme.bodyMedium,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          separator,
                                          const Icon(
                                            Icons.keyboard_double_arrow_down,
                                            size: 20,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 15),
                                              Expanded(
                                                child: InkWell(
                                                  splashFactory:
                                                      NoSplash.splashFactory,
                                                  splashColor:
                                                      Colors.transparent,
                                                  onTap: () {
                                                    push(
                                                      context: context,
                                                      page:
                                                          const ShippingAddressPage(),
                                                    );
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Rumah",
                                                              style: textTheme
                                                                  .bodyLarge,
                                                            ),
                                                            Text(
                                                              "Ciherang, Dramaga Kabupaten Bogor, Jawa Barat, 16680",
                                                              style: textTheme
                                                                  .bodyMedium,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        size: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    separator,
                                    separator,
                                    const Divider(
                                      color: PLThemeConstant.unselectedColor,
                                      height: 0.5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print("shiping");
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 15,
                                        ),
                                        child: Row(
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                      color: PLThemeConstant
                                                          .pinkDarkPrimary,
                                                      width: 2,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: PLThemeConstant
                                                        .pinkDarkPrimary,
                                                  ),
                                                  width: 10,
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                                width: PLThemeConstant.sizeM),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Wrap(
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Gratis Ongkir",
                                                      style: textTheme.bodyLarge
                                                          ?.copyWith(
                                                        color: PLThemeConstant
                                                            .pinkSecondary,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                      "Rp 15.000",
                                                      style: textTheme.bodySmall
                                                          ?.copyWith(
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Text(
                                                  "Estimasi kedatangan 15 Mei - 19 Mei",
                                                ),
                                                Text(
                                                  "Jasa pengiriman JNE Standart",
                                                  style: textTheme.bodySmall
                                                      ?.copyWith(
                                                    color: PLThemeConstant
                                                        .pinkDarkPrimary,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: PLThemeConstant.sizeXL,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          pop(context: context);
                                        },
                                        child: const Text("Konfirmasi"),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Rp15.000",
                                style: textTheme.bodySmall?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                              const SizedBox(width: 8),
                              const VoucherMiniWidget(),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: PLThemeConstant.blackPrimary,
                                size: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: PLThemeConstant.sizeM),
                    Text(
                      "Diskon ongkir Rp25rb minimal pembelian 20+, Diskon ongkir Rp30rb minimal pembelian 50Rb+",
                      style: textTheme.bodyMedium,
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(height: PLThemeConstant.sizeSS),
                    Text(
                      "Dari Jakarta Kota ke Kabupaten Bogor (perkiraan sampai 1 - 2 Hari )",
                      style: textTheme.bodyMedium,
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
              separator,
              Container(
                width: size.width,
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                profileSourceDummy,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "PetShop Keluarga",
                                  style: textTheme.bodyLarge,
                                  overflow: TextOverflow.clip,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: PLThemeConstant.yellowPrimary,
                                      size: 15,
                                    ),
                                    Text("4.5", style: textTheme.bodyMedium),
                                    const SizedBox(
                                      width: PLThemeConstant.sizeSS,
                                    ),
                                    Text("100 Items",
                                        style: textTheme.bodyMedium),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        OutlinedButton(
                          onPressed: () {
                            push(context: context, page: const StoreShopPage());
                          },
                          child: const Text("Kunjungi toko"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "lainnya dari toko ini",
                      style: textTheme.bodySmall
                          ?.copyWith(color: PLThemeConstant.blackPrimary),
                    ),
                    separator,
                    Container(
                      height: 80,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    dummyShop,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Vitamin Kucing",
                                  style: textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9,
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    Text(
                                      "Rp.20.000",
                                      style: textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 9,
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      "5%",
                                      style: textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 9,
                                        color: PLThemeConstant.pinkPrimary,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              separator,
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: PLThemeConstant.sizeSS),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ulasan pengguna (1032)",
                          style: textTheme.bodyLarge,
                          overflow: TextOverflow.clip,
                        ),
                        const SizedBox(width: PLThemeConstant.sizeS),
                        InkWell(
                          onTap: () {
                            push(
                              context: context,
                              page: const RatingProductPage(),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                "Lihat lainnya",
                                style: textTheme.bodySmall,
                                overflow: TextOverflow.clip,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: PLThemeConstant.blackPrimary,
                                size: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: PLThemeConstant.sizeM),
                    const RatingCommentWidget()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Mungkin anda juga menyukai ini",
                  style: textTheme.bodyMedium?.copyWith(
                    color: PLThemeConstant.blackPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15).copyWith(top: 0),
                child: MasonryGridView.count(
                  padding: EdgeInsets.zero.copyWith(top: 10),
                  crossAxisCount: 2,
                  crossAxisSpacing: PLThemeConstant.sizeS,
                  mainAxisSpacing: PLThemeConstant.sizeMS,
                  shrinkWrap: true,
                  itemCount: dummyProduct.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (c, index) {
                    final image = dummyProduct[index];
                    return ShopTileWidget.discovery(
                      index: index,
                      image: image,
                    );
                  },
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
