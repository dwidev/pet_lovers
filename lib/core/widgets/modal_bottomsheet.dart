import 'package:pet_lovers/core/navigator/navigator.dart';
import 'package:pet_lovers/core/petlovers_core.dart';

Future<void> showBaseModal(
  BuildContext context,
  Widget Function(BuildContext context) builder, {
  EdgeInsets? customePadding,
}) async {
  final bottom = MediaQuery.of(context).padding.bottom;

  await showModalBottomSheet(
    context: context,
    builder: (c) {
      return Stack(
        children: [
          Container(
            padding: customePadding?.add(
                  EdgeInsets.only(bottom: bottom + PLThemeConstant.sizeM),
                ) ??
                const EdgeInsets.all(PLThemeConstant.sizeM).copyWith(
                  bottom: bottom + PLThemeConstant.sizeM,
                ),
            child: builder(context),
          ),
          Positioned(
            right: 10,
            child: IconButton(
              onPressed: () {
                pop(context: context);
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      );
    },
  );
}
