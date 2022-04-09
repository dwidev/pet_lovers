import '../core/petlovers_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      ),
      body: Center(
        child: Container(
          color: PLThemeConstant.white,
          child: const Text('home'),
        ),
      ),
    );
  }
}
