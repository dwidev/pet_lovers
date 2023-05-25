// ignore_for_file: avoid_types_on_closure_parameters

import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pet_lovers/core/widgets/badge_widget.dart';

import '../../../../core/navigator/navigator.dart';
import '../../../../core/petlovers_core.dart';
import '../../../../core/widgets/voucher_widget.dart';
import '../../../home/presentations/page/home_page.dart';
import '../page/main/discover_shop_page.dart';
import '../widgets/shop_tile_widget.dart';

class StoreShopPage extends StatefulWidget {
  const StoreShopPage({super.key});

  @override
  State<StoreShopPage> createState() => _StoreShopPageState();
}

class _StoreShopPageState extends State<StoreShopPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;
  List<String> data = <String>[];

  @override
  void initState() {
    scrollController = ScrollController();
    tabController = TabController(length: 2, vsync: this);
    data = dummyProduct;
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> getPagingData() async {
    print("GET DATA");
    await Future.delayed(const Duration(seconds: 3));
    data = [...data, ...dummyProduct];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);

    return PetLoversScaffold(
      withCartAction: true,
      withSearchBar: true,
      backgroundColor: PLThemeConstant.lightPrimary,
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollEndNotification) {
            if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {}
          }
          return false;
        },
        child: NestedScrollView(
          controller: scrollController,
          key: GlobalKey(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Container(
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
                                      Text("| 100 Items",
                                          style: textTheme.bodyMedium),
                                      const SizedBox(
                                        width: PLThemeConstant.sizeSS,
                                      ),
                                      Text("| 20 terjual",
                                          style: textTheme.bodyMedium),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          OutlinedButton(
                            onPressed: () {
                              push(
                                  context: context,
                                  page: const StoreShopPage());
                            },
                            child: Row(
                              children: const [
                                Icon(
                                  CupertinoIcons.add,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Text("Ikuti"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ), //

              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: PLThemeConstant.sizeS,
                    bottom: PLThemeConstant.sizeS,
                  ),
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  width: size.width,
                  height: 125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Voucher Toko",
                        style: textTheme.displayMedium,
                      ),
                      separator,
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const VoucherWidget();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: SliverPersistentHeaderDelegateImpl(
                  tabBar: TabBar(
                    indicatorColor: Colors.black,
                    controller: tabController,
                    tabs: [
                      Tab(
                        child: Text(
                          "Beranda",
                          style: textTheme.bodyMedium,
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Produk",
                          style: textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                floating: true,
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: [
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: PLThemeConstant.sizeS,
                      ),
                      padding: const EdgeInsets.all(15),
                      color: Colors.white,
                      width: size.width,
                      height: 450,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width,
                            height: 150,
                            child: Image.network(
                              dummyProduct[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                          separator,
                          separator,
                          Text(
                            "Paling sering dibeli",
                            style: textTheme.displayMedium,
                          ),
                          separator,
                          separator,
                          Expanded(
                            child: ListView.builder(
                              itemCount: dummyProduct.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final data = dummyProduct[index];
                                return Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              data,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      separator,
                                      Text(
                                        "Whiskas",
                                        style: textTheme.displayMedium,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '20K',
                                              style: textTheme.bodyMedium
                                                  ?.copyWith(
                                                color: PLThemeConstant
                                                    .pinkPrimary
                                                    .withOpacity(0.5),
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            TextSpan(
                                                text: ' 45K',
                                                style: textTheme.displayLarge),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "450K Terjual",
                                        style: textTheme.bodySmall?.copyWith(
                                          fontSize: 10,
                                          color: PLThemeConstant.blackPrimary
                                              .withOpacity(
                                            0.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15).copyWith(top: 0),
                      child: MasonryGridView.count(
                        padding: EdgeInsets.zero.copyWith(top: 10),
                        crossAxisCount: 2,
                        crossAxisSpacing: PLThemeConstant.sizeS,
                        mainAxisSpacing: PLThemeConstant.sizeMS,
                        shrinkWrap: true,
                        itemCount: data.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (c, index) {
                          final image = data[index];
                          return ShopTileWidget.discovery(
                            index: index,
                            image: image,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15).copyWith(top: 0),
                child: MasonryGridView.count(
                  padding: EdgeInsets.zero.copyWith(top: 10),
                  crossAxisCount: 2,
                  crossAxisSpacing: PLThemeConstant.sizeS,
                  mainAxisSpacing: PLThemeConstant.sizeMS,
                  shrinkWrap: true,
                  itemCount: data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (c, index) {
                    final image = data[index];
                    return ShopTileWidget.discovery(
                      index: index,
                      image: image,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverPersistentHeaderDelegateImpl
    extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  SliverPersistentHeaderDelegateImpl({
    required this.tabBar,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
