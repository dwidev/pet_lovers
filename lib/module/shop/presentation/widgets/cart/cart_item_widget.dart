part of '../../page/cart/cart_page.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

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
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: PLThemeConstant.sizeM),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: PLThemeConstant.sizeM),
                child: Slidable(
                  key: ValueKey(index),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: PLThemeConstant.defaultGradient,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  child: Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
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
                                      style: textTheme.bodyLarge,
                                    ),
                                    Row(
                                      children: [
                                        const Text("varian : 5gr"),
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.arrow_drop_down),
                                          color:
                                              PLThemeConstant.unselectedColor,
                                          constraints: const BoxConstraints(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const StockWidget(),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: Text(
                            "43K",
                            style: textTheme.displayLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
