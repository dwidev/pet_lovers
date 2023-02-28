import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/base/local_storage/token_storage.dart';
import '../../../../core/navigator/navigator.dart';
import '../../../../core/petlovers_core.dart';
import '../../../adopt/presentation/widgets/adopt_tile_widget.dart';
import '../../../auth/presentation/page/splash_page.dart';
import '../../../shop/presentation/page/cart/cart_page.dart';
import '../../../shop/presentation/page/main/discover_shop_page.dart';
import '../../../shop/presentation/widgets/shop_tile_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

const profileSourceDummy =
    "https://pict-c.sindonews.net/dyn/620/pena/news/2021/12/28/207/640971/mark-zuckerberg-beli-bendungan-bekas-di-hawaii-rp240-miliar-odj.jpg";
const catDummyImage =
    "https://www.lyceum.id/wp-content/uploads/2021/01/images-71.jpeg";

class _HomePageState extends ConsumerState<HomePage> {
  final listCat = [
    catCollorfull,
    dogColorfull,
    owlColorfull,
    owlColorfull,
    more
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: PLThemeConstant.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: PLThemeConstant.white,
        leading: IconButton(
          onPressed: () {
            TokenStorage(localStorage: const FlutterSecureStorage())
                .deleteAll();
            pushAndRemoveAll(context: context, page: const SplashPage());
          },
          icon: Image.asset(
            homeMenu,
            width: 30,
            height: 30,
          ),
        ),
        title: Text(
          "Fahmi dwi syahputra",
          style: textTheme.bodyText2,
        ),
        actions: [
          IconButton(
            onPressed: () {
              push(context: context, page: const CartPage());
            },
            icon: Image.asset(
              addToCart,
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(PLThemeConstant.sizeM),
                child: Text(
                  "Selamat datang Pet Lovers!!",
                  style: textTheme.headline1,
                  overflow: TextOverflow.clip,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: PLThemeConstant.lightPrimary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(PLThemeConstant.radius + 10),
                    topRight: Radius.circular(PLThemeConstant.radius + 10),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: PLThemeConstant.sizeMS,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: PLThemeConstant.sizeML),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Telusuri apapun disini ....",
                      ),
                    ),
                    const SizedBox(height: PLThemeConstant.sizeML),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...listCat.map(
                          (icon) => PLButtonCircleWidget(
                            icon: icon,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: PLThemeConstant.sizeM),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Open adopt",
                          style: textTheme.bodyText1,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "lihat semua",
                            style: textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      height: 320,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (_, s) {
                          return const AdoptTileWidget();
                        },
                      ),
                    ),
                    const SizedBox(height: PLThemeConstant.sizeM),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shop",
                          style: textTheme.bodyText1,
                        ),
                        TextButton(
                          onPressed: () {
                            push(
                              context: context,
                              page: const DiscoverShopPage(),
                            );
                          },
                          child: Text(
                            "lihat semua",
                            style: textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      height: 311,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: dummyProduct.length,
                        itemBuilder: (_, s) {
                          final image = dummyProduct[s];
                          return ShopTileWidget(image: image);
                        },
                      ),
                    ),
                    const SizedBox(height: PLThemeConstant.sizeM),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Timeline",
                          style: textTheme.bodyText1,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "lihat semua",
                            style: textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                            bottom: PLThemeConstant.sizeS,
                          ),
                          width: double.infinity,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(
                                    PLThemeConstant.sizeM,
                                  ),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                              profileSourceDummy,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: PLThemeConstant.sizeS,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Fahmi Dwi S",
                                                style: textTheme.bodyText1,
                                              ),
                                              const Text(
                                                "20 Feb 2020 19:00 WIB",
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: PLThemeConstant.sizeM,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "#ask",
                                        style: textTheme.bodyText2?.copyWith(
                                            color: PLThemeConstant.bluePrimary),
                                      ),
                                      const Text(
                                        "Ada yang tau kucing ga nafsu makan udh 3 hari ini gambar nya semoga bisa bantu ya kakak2",
                                        maxLines: 3,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: PLThemeConstant.sizeM),
                                Container(
                                  height: 180,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Image.network(
                                            catDummyImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Image.network(
                                                  catDummyImage,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    child: Image.network(
                                                      catDummyImage,
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: double.infinity,
                                                    width: double.infinity,
                                                    color: Colors.black
                                                        .withOpacity(0.3),
                                                  ),
                                                  Text(
                                                    "+ 2",
                                                    style: textTheme.bodyText2
                                                        ?.copyWith(
                                                      fontSize: 23,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: PLThemeConstant.sizeM),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: PLThemeConstant.sizeS,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          PLButtonCircleWidget(
                                            icon: heart,
                                            buttonSize: 40,
                                            onPressed: () {},
                                          ),
                                          PLButtonCircleWidget(
                                            buttonSize: 40,
                                            icon: comment,
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                      const Text("2 like, 5 comment")
                                    ],
                                  ),
                                ),
                                const SizedBox(height: PLThemeConstant.sizeM),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
