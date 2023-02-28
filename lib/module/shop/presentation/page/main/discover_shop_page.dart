import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pet_lovers/module/shop/presentation/page/product/detail_product_shop_page.dart';
import 'package:pet_lovers/module/shop/presentation/widgets/shop_tile_widget.dart';

import '../../../../../core/navigator/navigator.dart';
import '../../../../../core/petlovers_core.dart';
import '../../../../../core/widgets/badge_widget.dart';
import '../../widgets/cart/cart_location_widget.dart';
import '../cart/cart_page.dart';

final dummyProduct = [
  dummyShop,
  "https://id-test-11.slatic.net/p/328c5d9f41eb6ce84d7e4441891471b2.jpg",
  "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//98/MTA-43358029/oem_oem_full01.jpg",
  "https://id-test-11.slatic.net/p/06c55c3af14ed0fbbf092ffc7a901c03.jpg",
  "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//93/MTA-10215929/oem_septimax_shampo_kucing_anti_kutu_sampo_kucing_anti_jamur_bakteri_perawatan_bulu_grooming_kucing_septimax_shampo_kucing_anti_kutu_sampo_kucing_full04_bb6r878a.jpg",
];

class DiscoverShopPage extends StatefulWidget {
  const DiscoverShopPage({Key? key}) : super(key: key);

  @override
  State<DiscoverShopPage> createState() => _DiscoverShopPageState();
}

class _DiscoverShopPageState extends State<DiscoverShopPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PetLoversScaffold(
      backgroundColor: PLThemeConstant.lightPrimary,
      withSearchBar: true,
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
        )
      ],
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CartLocationWidget(location: "Rumah"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PLThemeConstant.sizeM,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            color: PLThemeConstant.lightPrimary,
                            borderRadius: PLThemeConstant.cardBorderRadius * 2,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://www.static-src.com/siva/asset//11_2022/pet_fest_nov22-carousel.jpg?w=1236",
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Row(
                            children: [
                              ...[1, 2, 3]
                                  .map(
                                    (e) => Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: e == 1
                                            ? PLThemeConstant.pinkPrimary
                                            : Colors.white,
                                        borderRadius:
                                            PLThemeConstant.cardBorderRadius *
                                                2,
                                      ),
                                    ),
                                  )
                                  .toList()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 70,
                        child: Row(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: InkWell(
                                onTap: () {
                                  print("filter");
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    filterPink,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: BadgeWidget(
                                      index: index,
                                      title: "Makanan",
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
