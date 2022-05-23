import '../../../../core/petlovers_core.dart';

class AuthTextInput extends StatelessWidget {
  const AuthTextInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: PLThemeConstant.unselectedColor,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: "Username",
        ),
        style: const TextStyle(shadows: [
          BoxShadow(
            color: PLThemeConstant.unselectedColor,
          )
        ]),
      ),
    );
  }
}
