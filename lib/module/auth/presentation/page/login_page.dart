import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/navigator/navigator.dart';
import '../../../../core/petlovers_core.dart';
import '../../../../core/widgets/petlovers_loading.dart';
import '../../../home/presentations/page/home_page.dart';
import '../provider/auth_provider.dart';
import '../widgets/auth_text_field_widget.dart';
import 'interest_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = getSize(context);
    final event = ref.watch(authProvider.notifier);

    ref.listen<AsyncValue<bool>>(authProvider, (_, state) {
      state.when(
        loading: () {
          showPetLoading(context);
        },
        data: (data) {
          pop(context: context);

          if (data) {
            pushAndRemoveAll(context: context, page: const HomePage());
          } else {
            push(context: context, page: const InterestPage());
          }
        },
        error: (error, s) {
          pop(context: context);
        },
      );
    });

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Masuk!",
                            style: getTextTheme(context).bodyLarge?.copyWith(
                                  fontSize: 20,
                                ),
                          ),
                          const Text("Jelajahi kebutuhan hewan kesayangan mu"),
                          const SizedBox(height: PLThemeConstant.sizeML),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              AuthTextInput(
                                controller: usernameController,
                              ),
                              const SizedBox(height: PLThemeConstant.sizeM),
                              AuthTextInput(
                                controller: passwordController,
                                isSecure: true,
                              ),
                              const SizedBox(height: PLThemeConstant.sizeM),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: "Lupa kata sandi?"),
                                    TextSpan(
                                      text: " Klik disini",
                                      style: getTextTheme(context)
                                          .bodyMedium
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
                                  if (formKey.currentState?.validate() ==
                                      true) {
                                    event.doLogin(
                                      usernameController.text,
                                      passwordController.text,
                                    );
                                  }
                                },
                                child: const Text("Masuk"),
                              )
                            ],
                          )
                        ],
                      ),
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
