import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:pet_lovers/constant/colors.constant.dart';
import 'package:pet_lovers/views/home.view.dart';

class SplashView extends StatefulWidget {
  SplashView({Key key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return HomeView();
        },
      ), (route) => false);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                      color: ColorsConstant.blackPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'Lovers! ',
                    style: TextStyle(
                      color: ColorsConstant.pinkPrimary,
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
                style:
                    TextStyle(color: ColorsConstant.blackPrimary, fontSize: 16),
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
                      color: ColorsConstant.pinkPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'Hewan',
                    style: TextStyle(
                      color: ColorsConstant.blackPrimary,
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
