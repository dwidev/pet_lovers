import 'package:pet_lovers/module/home/presentations/page/home_page.dart';

import '../../../../core/petlovers_core.dart';

class ShopTileWidget extends StatelessWidget {
  const ShopTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 150,
      // height: 310,
      margin: const EdgeInsets.symmetric(
        horizontal: PLThemeConstant.sizeS,
        vertical: PLThemeConstant.sizeM,
      ),
      child: Card(
        margin: EdgeInsets.zero,
        child: Material(
          borderRadius: PLThemeConstant.cardBorderRadius,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://id-test-11.slatic.net/p/328c5d9f41eb6ce84d7e4441891471b2.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
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
                        style: textTheme.bodyText1,
                        maxLines: 1,
                      ),
                      const Text(
                        "Pet shop dramaga,  75km",
                        maxLines: 2,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '20K',
                              style: textTheme.bodyText2?.copyWith(
                                color: PLThemeConstant.pinkPrimary,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(text: ' 45K', style: textTheme.headline1),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: PLThemeConstant.sizeM,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.yellow),
                              Text("4.5", style: textTheme.bodyText2),
                            ],
                          ),
                          Text("Terjual 25", style: textTheme.bodyText2),
                        ],
                      ),
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
