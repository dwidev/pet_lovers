import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/navigator/navigator.dart';
import '../../../../core/petlovers_core.dart';
import '../../../../core/widgets/petlovers_loading.dart';
import '../../../home/presentations/page/home_page.dart';
import '../../domain/enum/auth_status.dart';
import '../provider/splash_provider.dart';
import 'login_page.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    ref.read(splashProvider.notifier).doCheckingAccessToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(splashProvider, (previous, next) {
      next.when(
        data: (data) {
          if (data == AuthenticationStatus.authentication) {
            pushAndRemoveAll(context: context, page: const HomePage());
          } else {
            pushAndRemoveAll(context: context, page: const LoginPage());
          }
        },
        error: (error, s) {
          print("e $error");
        },
        loading: () {
          showPetLoading(context);
        },
      );
    });

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Stack(
          children: [
            Column(
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
                const SizedBox(height: 2),
                Container(
                  width: 230,
                  child: const Text(
                    'Dengan ini rasa sayang dengan hewan mu bertambah.',
                    style: TextStyle(
                      color: PLThemeConstant.blackPrimary,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
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
            const Positioned.fill(
              bottom: PLThemeConstant.sizeM,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
