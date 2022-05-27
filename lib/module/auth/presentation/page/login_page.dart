import '../../../../core/navigator/navigator.dart';
import '../../../../core/petlovers_core.dart';
import '../widgets/auth_text_field_widget.dart';
import 'interest_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = getSize(context);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: PLThemeConstant.topToBottomGradient,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, 42),
                    child: Image.asset(
                      loginOverlay,
                      width: size.width,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(PLThemeConstant.sizeM),
                    width: size.width,
                    // height: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Masuk!",
                          style: getTextTheme(context).bodyText1?.copyWith(
                                fontSize: 20,
                              ),
                        ),
                        const Text("Jelajahi kebutuhan hewan kesayangan mu"),
                        const SizedBox(height: PLThemeConstant.sizeML),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const AuthTextInput(),
                            const SizedBox(height: PLThemeConstant.sizeM),
                            const AuthTextInput(),
                            const SizedBox(height: PLThemeConstant.sizeM),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: "Lupa kata sandi?"),
                                  TextSpan(
                                    text: " Klik disini",
                                    style: getTextTheme(context)
                                        .bodyText2
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: PLThemeConstant.pinkPrimary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: PLThemeConstant.sizeM),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                PLButtonCircleWidget(
                                  buttonSize: 40,
                                  icon: googleIcon,
                                  onPressed: () {},
                                ),
                                const SizedBox(width: PLThemeConstant.sizeM),
                                PLButtonCircleWidget(
                                  buttonSize: 40,
                                  icon: fbIcon,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                push(
                                  context: context,
                                  page: const InterestPage(),
                                );
                              },
                              child: const Text("Masuk"),
                            )
                          ],
                        )
                      ],
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
