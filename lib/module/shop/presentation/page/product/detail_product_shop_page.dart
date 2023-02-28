import 'package:flutter/cupertino.dart';

import '../../../../../core/navigator/navigator.dart';
import '../../../../../core/petlovers_core.dart';
import '../../../../../core/widgets/badge_widget.dart';
import '../../../../home/presentations/page/home_page.dart';
import '../../widgets/product/detail_product_bottom_button.dart';

const dummyShop =
    "https://st3.depositphotos.com/1063437/18549/i/450/depositphotos_185496108-stock-photo-whiskas-cat-food-products-of.jpg";

class DetailProductShop extends StatelessWidget {
  const DetailProductShop({Key? key}) : super(key: key);

  Widget get separator {
    return const SizedBox(height: PLThemeConstant.sizeS);
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
                    padding: EdgeInsets.zero,
                    width: size.width,
                    height: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(dummyShop),
                        fit: BoxFit.cover,
                      ),
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
                        "1/5",
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
                        Row(
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
                        Row(
                          children: [
                            Text(
                              "Rp15.000",
                              style: textTheme.bodySmall?.copyWith(
                                decoration: TextDecoration.lineThrough,
                              ),
                              overflow: TextOverflow.clip,
                            ),
                            BadgeWidget(
                              title: "Gratis ongkir",
                              noShadow: true,
                              backgroundColor: PLThemeConstant.pinkSecondary,
                              borderRadius: BorderRadius.circular(2),
                              textTheme: textTheme.bodySmall?.copyWith(
                                color: PLThemeConstant.white,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: PLThemeConstant.blackPrimary,
                              size: 10,
                            )
                          ],
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            )
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Ikuti"),
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
                        Row(
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
                        )
                      ],
                    ),
                    const SizedBox(height: PLThemeConstant.sizeM),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            profileSourceDummy,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Fahmi dwi s",
                                    style: textTheme.bodyLarge,
                                    overflow: TextOverflow.clip,
                                  ),
                                  const SizedBox(width: PLThemeConstant.sizeSS),
                                  Text(
                                    "17/04/2023 - 17:05",
                                    style: textTheme.bodySmall,
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => const Icon(
                                    Icons.star,
                                    color: PLThemeConstant.yellowPrimary,
                                    size: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(height: PLThemeConstant.sizeMS),
                              Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
                                style: textTheme.bodyMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: PLThemeConstant.sizeMS),
                              Row(
                                children: List.generate(3, (index) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: PLThemeConstant.unselectedColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            "https://s4.bukalapak.com/img/96923196592/s-463-463/data.jpeg.webp",
                                            fit: BoxFit.cover,
                                          ),
                                          if ((index + 1) == 3)
                                            Container(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "+3",
                                                style: textTheme.bodyMedium
                                                    ?.copyWith(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              separator,
              separator,
              separator,
            ],
          ),
        ),
      ),
    );
  }
}
