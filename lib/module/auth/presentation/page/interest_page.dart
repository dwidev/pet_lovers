import 'package:pet_lovers/core/navigator/navigator.dart';
import 'package:pet_lovers/module/home/presentations/page/home_page.dart';

import '../../../../core/petlovers_core.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({Key? key}) : super(key: key);

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final viewPadding = getViewPadding(context);
    final textTheme = getTextTheme(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: viewPadding.top * 2),
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: PLThemeConstant.topToBottomGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pilih hewan peliharaan mu!",
              style: textTheme.headline1?.copyWith(
                color: PLThemeConstant.white,
              ),
            ),
            Container(
              width: size.width / 1.5,
              child: Text(
                "agar kami bisa memilihkan konten yang seuai untukmu",
                style: textTheme.bodyText2?.copyWith(
                  color: PLThemeConstant.white,
                ),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: PLThemeConstant.sizeM),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              padding: const EdgeInsets.all(PLThemeConstant.sizeM),
              children: List.generate(12, (index) {
                final isMultiple3 = ((index + 1) % 3) == 0;
                return Container(
                  margin: EdgeInsets.only(
                    right: isMultiple3 ? 0 : 10,
                    bottom: 15,
                  ),
                  width: (size.width / 3) - PLThemeConstant.sizeM,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: PLThemeConstant.cardBorderRadius,
                    boxShadow: const [PLThemeConstant.boxShadow],
                  ),
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: PLThemeConstant.cardBorderRadius,
                    child: InkWell(
                      onTap: () {
                        print("Tap");
                      },
                      child: Center(
                        child: Text(
                          "Kucing",
                          style: textTheme.bodyText2?.copyWith(
                            fontSize: 20,
                            color: PLThemeConstant.pinkPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: PLThemeConstant.sizeS),
            ElevatedButton(
              onPressed: () {
                push(context: context, page: const HomePage());
              },
              child: const Text("Lanjut"),
            ),
            const SizedBox(height: PLThemeConstant.sizeS),
            TextButton(
              onPressed: () {},
              child: Text(
                "Lewati",
                style: textTheme.bodyText2,
              ),
            ),
            const SizedBox(height: PLThemeConstant.sizeML),
          ],
        ),
      ),
    );
  }
}
