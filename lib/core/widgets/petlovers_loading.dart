import '../petlovers_core.dart';

void showPetLoading(BuildContext context) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, a, s) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(PLThemeConstant.sizeMS),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: PLThemeConstant.blackPrimary.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
            child: const CircularProgressIndicator(),
          ),
        ),
      );
    },
  );
}
