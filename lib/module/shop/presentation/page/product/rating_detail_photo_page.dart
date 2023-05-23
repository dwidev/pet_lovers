import '../../../../../core/navigator/navigator.dart';
import '../../../../../core/petlovers_core.dart';
import '../../../../home/presentations/page/home_page.dart';
import '../main/discover_shop_page.dart';

class RatingDetailPhotoPage extends StatefulWidget {
  const RatingDetailPhotoPage({super.key});

  @override
  State<RatingDetailPhotoPage> createState() => _RatingDetailPhotoPageState();
}

class _RatingDetailPhotoPageState extends State<RatingDetailPhotoPage>
    with SingleTickerProviderStateMixin {
  int page = 1;
  late PageController tabController;

  @override
  void initState() {
    tabController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            Text(
              "Whiskas",
              style: textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
            Text(
              "90Gram",
              style: textTheme.bodySmall?.copyWith(color: Colors.white),
            ),
          ],
        ),
        leading: InkWell(
          onTap: () {
            pop(context: context);
          },
          child: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Center(
              child: Text(
                "$page/${dummyProduct.length}",
                style: textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            PageView.builder(
              itemCount: dummyProduct.length,
              controller: tabController,
              itemBuilder: (context, index) {
                final data = dummyProduct[index];
                return Center(
                  child: Image.network(
                    data,
                    fit: BoxFit.contain,
                  ),
                );
              },
              onPageChanged: (page) {
                setState(() {
                  this.page = page + 1;
                });
              },
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(
                        profileSourceDummy,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      width: getSize(context).width / 1.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Fahmi dwi s",
                                style: textTheme.bodyLarge?.copyWith(
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                              const SizedBox(width: PLThemeConstant.sizeSS),
                              Text(
                                "17/04/2023 - 17:05",
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
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
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
