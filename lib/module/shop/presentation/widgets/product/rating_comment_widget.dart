import 'package:pet_lovers/core/navigator/navigator.dart';
import 'package:pet_lovers/module/shop/presentation/page/product/rating_detail_photo_page.dart';

import '../../../../../core/petlovers_core.dart';
import '../../../../home/presentations/page/home_page.dart';

class RatingCommentWidget extends StatelessWidget {
  const RatingCommentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            profileSourceDummy,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Fahmi dwi s",
                    style: textTheme.bodyLarge,
                    overflow: TextOverflow.clip,
                  ),
                  const SizedBox(width: PLThemeConstant.sizeSS),
                  Text(
                    "17/04/2023 - 17:05",
                    style: textTheme.bodySmall,
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    color: PLThemeConstant.yellowPrimary,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(height: PLThemeConstant.sizeMS),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
                style: textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: PLThemeConstant.sizeMS),
              Row(
                children: List.generate(3, (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: PLThemeConstant.unselectedColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              pushWithOpacity(
                                context: context,
                                page: const RatingDetailPhotoPage(),
                              );
                            },
                            child: Image.network(
                              "https://s4.bukalapak.com/img/96923196592/s-463-463/data.jpeg.webp",
                              fit: BoxFit.cover,
                            ),
                          ),
                          if ((index + 1) == 3)
                            Container(
                              color: Colors.black.withOpacity(0.5),
                              alignment: Alignment.center,
                              child: Text(
                                "+3",
                                style: textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        )
      ],
    );
  }
}
