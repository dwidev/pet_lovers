import '../../../../../core/navigator/navigator.dart';
import '../../../../../core/petlovers_core.dart';
import '../../widgets/product/rating_comment_widget.dart';
import '../cart/cart_page.dart';

class RatingProductPage extends StatefulWidget {
  const RatingProductPage({super.key});

  @override
  State<RatingProductPage> createState() => _RatingProductPageState();
}

class _RatingProductPageState extends State<RatingProductPage> {
  final ratingTab = [
    'Sesuai dengan deskripsi',
    'Packing Rapih',
    'Harga Terjangkau',
    'Seler Ramah',
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return PetLoversScaffold(
      title: "Ulasan pengguna (1032)",
      backgroundColor: PLThemeConstant.lightPrimary,
      actions: [
        IconButton(
          onPressed: () {
            push(context: context, page: const CartPage());
          },
          icon: Image.asset(
            addToCart,
            width: 25,
            height: 25,
          ),
        )
      ],
      appBarBottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ...['cam', '5', '4', '3', '2', '1'].map((e) {
                return Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: InkWell(
                    onTap: () {
                      print("test");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 0.5,
                          color: e == 'cam'
                              ? PLThemeConstant.pinkSecondary
                              : PLThemeConstant.unselectedColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          if (e == 'cam') ...{
                            const Icon(
                              Icons.camera_alt_rounded,
                              color: PLThemeConstant.blackPrimary,
                              size: 13,
                            ),
                            Text(
                              " (1000)",
                              style: textTheme.bodySmall?.copyWith(
                                color: PLThemeConstant.pinkSecondary,
                              ),
                            ),
                          } else ...{
                            Text(
                              e,
                              style: textTheme.bodySmall,
                            ),
                            const Icon(
                              Icons.star,
                              color: PLThemeConstant.yellowPrimary,
                              size: 13,
                            ),
                            Text(
                              " (10)",
                              style: textTheme.bodySmall,
                            ),
                          },
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(PLThemeConstant.sizeS),
              width: getSize(context).width,
              color: Colors.white,
              child: Wrap(
                children: [
                  ...List.generate(ratingTab.length, (index) {
                    final data = ratingTab[index];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(right: 10, bottom: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: PLThemeConstant.lightPrimary,
                          borderRadius: BorderRadius.circular(5),
                          border: index == 0
                              ? Border.all(
                                  width: 0.5,
                                  color: PLThemeConstant.pinkSecondary,
                                )
                              : null,
                        ),
                        child: Wrap(
                          children: [
                            Text(
                              "$data (100)",
                              style: textTheme.bodySmall?.copyWith(
                                color: index == 0
                                    ? PLThemeConstant.pinkSecondary
                                    : null,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            Container(
              width: getSize(context).width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  separator,
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(15),
                    child: const RatingCommentWidget(),
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
