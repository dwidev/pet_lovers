import '../../core/petlovers_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

const profileSourceDummy =
    "https://instagram.fcgk11-1.fna.fbcdn.net/v/t51.2885-19/57012695_1881817091923395_5096579231916228608_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fcgk11-1.fna.fbcdn.net&_nc_cat=103&_nc_ohc=A62qGJ9dRPUAX9P5AQd&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT8CQrrqsi8_Ogtr92P6sjWCQPoVR_MTaoIX5qD1GwBUvg&oe=6258D2C5&_nc_sid=7bff83";

class _HomePageState extends State<HomePage> {
  final listCat = [
    catCollorfull,
    dogColorfull,
    owlColorfull,
    owlColorfull,
    more
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: PLThemeConstant.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: PLThemeConstant.white,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            homeMenu,
            width: 30,
            height: 30,
          ),
        ),
        title: Text(
          "Fahmi dwi syahputra",
          style: textTheme.bodyText2,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              addToCart,
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(PLThemeConstant.sizeM),
              child: Text(
                "Selamat datang Pet Lovers!!",
                style: textTheme.headline1,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: PLThemeConstant.lightPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(PLThemeConstant.radius + 10),
                  topRight: Radius.circular(PLThemeConstant.radius + 10),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: PLThemeConstant.sizeMS,
              ),
              child: Column(
                children: [
                  const SizedBox(height: PLThemeConstant.sizeML),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Telusuri apapun disini ....",
                    ),
                  ),
                  const SizedBox(height: PLThemeConstant.sizeML),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...listCat.map(
                        (icon) => Container(
                          width: 70,
                          child: Card(
                            shape: const CircleBorder(),
                            child: Material(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.circular(
                                  PLThemeConstant.radius * 10,
                                ),
                                child: InkWell(
                                  onTap: () {
                                    print("category");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      PLThemeConstant.sizeMS,
                                    ),
                                    child: icon != more
                                        ? Container(
                                            width: 20,
                                            child: Image.asset(
                                              icon,
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              Image.asset(
                                                icon,
                                                width: 30,
                                              ),
                                            ],
                                          ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: PLThemeConstant.sizeM),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Open adopt",
                        style: textTheme.bodyText1,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "lihat semua",
                          style: textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    height: 310,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (_, s) {
                        return Container(
                          width: 150,
                          height: 310,
                          margin: const EdgeInsets.symmetric(
                            horizontal: PLThemeConstant.sizeS,
                            vertical: 20,
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
                                          image: AssetImage(
                                              "assets/images/persia.jpeg"),
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.amber,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Persia",
                                            style: textTheme.bodyText1,
                                            maxLines: 1,
                                          ),
                                          const Text(
                                            "Lorem ipsum si dolor emet Lorem ipsum si dolor emet Lorem ipsum si dolor emet Lorem ipsum si dolor emet",
                                            maxLines: 2,
                                          ),
                                          Text(
                                            "500k",
                                            style: textTheme.headline1,
                                          ),
                                          const SizedBox(
                                            height: PLThemeConstant.sizeS,
                                          ),
                                          const Card(
                                            margin: EdgeInsets.zero,
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundImage: NetworkImage(
                                                profileSourceDummy,
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
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
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
