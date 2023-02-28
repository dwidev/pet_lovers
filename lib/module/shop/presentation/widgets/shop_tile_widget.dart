import '../../../../core/petlovers_core.dart';
import '../page/product/detail_product_shop_page.dart';

class ShopTileWidget extends StatelessWidget {
  const ShopTileWidget({
    Key? key,
    this.index = 0,
    this.withoutMargin = false,
    this.noCartButton = false,
    this.image,
    this.hideFlashSale = true,
  }) : super(key: key);

  final int index;
  final bool withoutMargin;
  final bool noCartButton;
  final String? image;
  final bool hideFlashSale;

  factory ShopTileWidget.discovery({
    required int index,
    String? image,
  }) {
    return ShopTileWidget(
      index: index,
      noCartButton: true,
      withoutMargin: true,
      image: image,
      hideFlashSale: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final endDate = DateTime.now().add(const Duration(days: 5));

    return Container(
      width: 150,
      // height: 310,
      margin: withoutMargin
          ? null
          : const EdgeInsets.symmetric(
              horizontal: PLThemeConstant.sizeS,
              vertical: PLThemeConstant.sizeM,
            ),
      child: Card(
        margin: EdgeInsets.zero,
        child: Material(
          borderRadius: PLThemeConstant.cardBorderRadius,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              // openDetailProduct(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DetailProductShop(),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            image ??
                                "https://id-test-11.slatic.net/p/328c5d9f41eb6ce84d7e4441891471b2.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(
                            PLThemeConstant.radius,
                          ),
                          topRight: Radius.circular(
                            PLThemeConstant.radius,
                          ),
                          bottomLeft: Radius.circular(
                            50,
                          ),
                        ),
                      ),
                    ),
                    if (noCartButton == false) ...{
                      Positioned(
                        top: PLThemeConstant.sizeSS,
                        right: 5,
                        child: PLButtonCircleWidget.gradient(
                          icon: addToCartWhite,
                          gradiendBackgroundColor: const [
                            PLThemeConstant.pinkSecondary,
                            PLThemeConstant.pinkPrimary
                          ],
                          onPressed: () {},
                          buttonSize: PLThemeConstant.sizeXL,
                        ),
                      ),
                    },
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(
                    PLThemeConstant.sizeS,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Royal canin",
                        style: textTheme.bodyLarge,
                        maxLines: 1,
                      ),
                      const Text(
                        "Pet shop dramaga,  75km",
                        maxLines: 2,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '20K',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: PLThemeConstant.pinkPrimary
                                        .withOpacity(0.5),
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                TextSpan(
                                    text: ' 45K',
                                    style: textTheme.displayLarge),
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: PLThemeConstant.pinkSecondary
                                    .withOpacity(0.8),
                              ),
                            ),
                            child: Text(
                              "COD",
                              style: textTheme.titleSmall?.copyWith(
                                color: PLThemeConstant.pinkPrimary,
                                fontSize: 8,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: PLThemeConstant.sizeS),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: PLThemeConstant.yellowPrimary,
                                size: 20,
                              ),
                              Text("4.5", style: textTheme.bodyMedium),
                            ],
                          ),
                          Text("Terjual 25", style: textTheme.bodyMedium),
                        ],
                      ),
                      if (hideFlashSale == false && index == 0) ...{
                        const SizedBox(height: PLThemeConstant.sizeS),
                        Wrap(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    PLThemeConstant.yellowPrimary,
                                    PLThemeConstant.white,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Flash sale",
                                    style: textTheme.bodySmall?.copyWith(
                                      color: PLThemeConstant.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.bolt_rounded,
                                    color: PLThemeConstant.white,
                                    size: 20,
                                  ),
                                  StreamBuilder(
                                    stream: Stream.periodic(
                                        const Duration(seconds: 1), (i) => i),
                                    builder: (context, snapshot) {
                                      final d =
                                          endDate.difference(DateTime.now());
                                      final hours = d.inHours % 24;
                                      final minute = d.inMinutes % 60;
                                      final secods = d.inSeconds % 60;
                                      return Text(
                                        "$hours:$minute:$secods",
                                        style: textTheme.bodySmall?.copyWith(
                                          color: PLThemeConstant.blackPrimary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      },
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
