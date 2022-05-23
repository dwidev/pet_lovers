part of '../../page/cart/cart_page.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

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
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: false,
                onChanged: (value) {},
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: false,
                      onChanged: (value) {},
                    ),
                    const SizedBox(width: PLThemeConstant.sizeS),
                    Container(
                      width: size.width / 3.5,
                      height: size.width / 4,
                      decoration: BoxDecoration(
                        color: PLThemeConstant.unselectedColor,
                        borderRadius: PLThemeConstant.cardBorderRadius,
                        image: const DecorationImage(
                          image: NetworkImage(_cartImageDummy),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: PLThemeConstant.sizeS),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  icon: const Icon(Icons.arrow_drop_down),
                                  color: PLThemeConstant.unselectedColor,
                                  constraints: const BoxConstraints(),
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
                              style: textTheme.bodyText1?.copyWith(
                                fontSize: PLThemeConstant.sizeM,
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
  }
}
