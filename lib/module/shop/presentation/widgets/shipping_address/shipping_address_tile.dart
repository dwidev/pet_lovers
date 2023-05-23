import '../../../../../core/petlovers_core.dart';

class ShippingAddressTile extends StatelessWidget {
  final bool isSelected;

  const ShippingAddressTile({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return InkWell(
      onTap: () {
        print("shipping");
      },
      child: Column(
        children: [
          Container(
            width: getSize(context).width,
            color: isSelected
                ? PLThemeConstant.pinkSecondary.withOpacity(0.2)
                : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? PLThemeConstant.pinkDarkPrimary
                              : PLThemeConstant.unselectedColor,
                          width: 2,
                        ),
                        color: Colors.white,
                      ),
                      width: 20,
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isSelected
                            ? PLThemeConstant.pinkDarkPrimary
                            : PLThemeConstant.unselectedColor,
                      ),
                      width: 10,
                      height: 10,
                    ),
                  ],
                ),
                const SizedBox(width: PLThemeConstant.sizeM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Fahmi Dwi Syahputra (Rumah)",
                            style: textTheme.displayMedium,
                          ),
                          Text(
                            "Ubah",
                            style: textTheme.bodyLarge?.copyWith(
                              color: PLThemeConstant.pinkSecondary,
                            ),
                          ),
                        ],
                      ),
                      const Text("+6289516262195"),
                      Container(
                        width: getSize(context).width / 1.5,
                        child: const Text(
                          "Dramaga, Kabupaten Bogor, Jawa Barat, 16680 (2 rumah dibelakang gadai)",
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
