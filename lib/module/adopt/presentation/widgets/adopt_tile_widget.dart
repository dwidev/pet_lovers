import '../../../../core/petlovers_core.dart';

class AdoptTileWidget extends StatelessWidget {
  const AdoptTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 150,
      height: 310,
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
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/persia.jpeg"),
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
                Container(
                  padding: const EdgeInsets.all(
                    PLThemeConstant.sizeS,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Persia",
                        style: textTheme.bodyLarge,
                        maxLines: 1,
                      ),
                      const Text(
                        "Lorem ipsum si dolor emet Lorem ipsum si dolor emet Lorem ipsum si dolor emet Lorem ipsum si dolor emet",
                        maxLines: 2,
                      ),
                      Text(
                        "500k",
                        style: textTheme.displayLarge,
                      ),
                      const SizedBox(
                        height: PLThemeConstant.sizeS,
                      ),
                      const Card(
                        margin: EdgeInsets.zero,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(bird),
                          backgroundColor: Colors.transparent,
                        ),
                      )
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
