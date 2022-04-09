import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../constant/colors.constant.dart';

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
            Image.asset(
              'assets/bird.png',
              width: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/cat.png',
                  width: 110,
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Image.asset(
                    'assets/dog.png',
                    width: 110,
                  ),
                ),
                SizedBox(
                  width: 14,
                )
              ],
            ),
            SizedBox(height: 15),
            Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'Pet ',
                    style: TextStyle(
                      color: PLColor.blackPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'Lovers! ',
                    style: TextStyle(
                      color: PLColor.pinkPrimary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 230,
              child: Text(
                'Dengan ini rasa sayang dengan hewan mu bertambah.',
                style: TextStyle(color: PLColor.blackPrimary, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 5),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '#Sayangi',
                    style: TextStyle(
                      color: PLColor.pinkPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'Hewan',
                    style: TextStyle(
                      color: PLColor.blackPrimary,
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
