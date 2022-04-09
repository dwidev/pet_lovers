import 'dart:math' as math;

import '../core/petlovers_core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(bird, width: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(cat, width: 110),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Image.asset(dog, width: 110),
                ),
                const SizedBox(
                  width: 14,
                )
              ],
            ),
            const SizedBox(height: 15),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'Pet ',
                    style: TextStyle(
                      color: PLThemeConstant.blackPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'Lovers! ',
                    style: TextStyle(
                      color: PLThemeConstant.pinkPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: 230,
              child: const Text(
                'Dengan ini rasa sayang dengan hewan mu bertambah.',
                style: TextStyle(
                    color: PLThemeConstant.blackPrimary, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '#Sayangi',
                    style: TextStyle(
                      color: PLThemeConstant.pinkPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'Hewan',
                    style: TextStyle(
                      color: PLThemeConstant.blackPrimary,
                    ),
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
