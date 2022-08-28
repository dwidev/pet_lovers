import '../../../../../core/petlovers_core.dart';
import '../../widgets/product/detail_product_bottom_button.dart';

const dummyShop =
    "https://st3.depositphotos.com/1063437/18549/i/450/depositphotos_185496108-stock-photo-whiskas-cat-food-products-of.jpg";

class DetailProductShop extends StatelessWidget {
  const DetailProductShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final textTheme = getTextTheme(context);

    return PetLoversScaffold(
      bottomFloating: DetailProductShopBottomButtonWidget(
        onPressedCart: () {},
        onPressedCheckout: () {},
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.zero,
                width: size.width,
                height: 250,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(dummyShop),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(store, width: 20),
                        const SizedBox(width: PLThemeConstant.sizeSS),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Dwi pet care",
                                style: textTheme.bodyText1,
                              ),
                              const TextSpan(
                                text: ", 75 Km",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: PLThemeConstant.sizeM),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "Whiskas",
                            style: textTheme.headline1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        const SizedBox(width: PLThemeConstant.sizeS),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: PLThemeConstant.yellowPrimary,
                            ),
                            Text("4.5", style: textTheme.bodyText1),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: PLThemeConstant.sizeSS),
                    const Text(
                      "Lorem ipsum si dolor emet Lorem ipsum si dolor emet Lorem ipsum si dolor emet Lorem ipsum si dolor emet Lorem ips",
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: PLThemeConstant.sizeXXL),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
