import 'dart:math';

import 'package:pet_lovers/core/navigator/navigator.dart';
import 'package:pet_lovers/module/home/presentations/page/home_page.dart';

import '../../../../core/petlovers_core.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({Key? key}) : super(key: key);

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opcityAnimation;
  List<String> listIcon = [];
  final sample = [
    catCollorfull,
    owlColorfull,
    dogColorfull,
    rabbit,
    turtle,
    hamster,
    birdBlue,
  ];
  int? selected;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    opcityAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    // opcityAnimation.addListener(() {
    //   setState(() {});
    // });
    // animationController.forward(from: 0);
    for (var i = 0; i < 1; i++) {
      listIcon.addAll(sample);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void setInterest(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final viewPadding = getViewPadding(context);
    final textTheme = getTextTheme(context);

    return Scaffold(
      body: Container(
        padding: viewPadding * 1.5,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: PLThemeConstant.topToBottomGradient,
        ),
        child: Stack(
          children: [
            ...listIcon.map(
              (e) {
                final widthImage =
                    double.parse(Random().nextInt(100).toString());
                final offsetx = double.parse(
                    Random().nextInt(size.width.toInt()).toString());
                final offsety = double.parse(
                    Random().nextInt(size.height.toInt()).toString());
                return Opacity(
                  opacity: 1,
                  // bottom: scorePosition,
                  child: Transform.translate(
                    offset: Offset(offsetx, offsety),
                    child: Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        e,
                        width: widthImage < 70 ? 70 : widthImage,
                      ),
                    ),
                  ),
                );
              },
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Pilih hewan peliharaan mu!",
                    style: textTheme.displayLarge?.copyWith(
                      color: PLThemeConstant.white,
                    ),
                  ),
                  Container(
                    width: size.width / 1.5,
                    child: Text(
                      "agar kami bisa memilihkan konten yang seuai untukmu",
                      style: textTheme.displayLarge?.copyWith(
                        color: PLThemeConstant.white,
                      ),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: PLThemeConstant.sizeM),
                  GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.1,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(PLThemeConstant.sizeM),
                    children: List.generate(12, (index) {
                      final isMultiple3 = ((index + 1) % 3) == 0;
                      final color = index == selected
                          ? PLThemeConstant.pinkPrimary
                          : Colors.white;
                      final textColor = index != selected
                          ? PLThemeConstant.pinkPrimary
                          : Colors.white;
                      return Container(
                        margin: EdgeInsets.only(
                          right: isMultiple3 ? 0 : 10,
                          bottom: 15,
                        ),
                        width: (size.width / 3) - PLThemeConstant.sizeM,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: PLThemeConstant.cardBorderRadius,
                          boxShadow: [PLThemeConstant.boxShadow],
                        ),
                        child: Material(
                          color: color,
                          clipBehavior: Clip.hardEdge,
                          borderRadius: PLThemeConstant.cardBorderRadius,
                          child: InkWell(
                            onTap: () {
                              setInterest(index);
                            },
                            child: Center(
                              child: Text(
                                "Kucing",
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.center,
                                style: textTheme.bodyMedium?.copyWith(
                                  fontSize: 20,
                                  color: textColor,
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
                      pushAndRemoveAll(
                          context: context, page: const HomePage());
                    },
                    child: const Text("Lanjut"),
                  ),
                  const SizedBox(height: PLThemeConstant.sizeS),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Lewati",
                      style: textTheme.bodyMedium,
                    ),
                  ),
                  // const SizedBox(height: PLThemeConstant.sizeML),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
