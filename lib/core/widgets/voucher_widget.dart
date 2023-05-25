import '../petlovers_core.dart';

class VoucherWidget extends StatelessWidget {
  const VoucherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return VoucherBaseWidget(
      curvePosition: 20,
      curveRadius: 10,
      borderRadius: 5,
      curveAxis: Axis.vertical,
      firstChild: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: [
              PLThemeConstant.pinkSecondary.withOpacity(0.2),
              PLThemeConstant.pinkSecondary.withOpacity(0.5),
              PLThemeConstant.pinkSecondary,
            ],
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Diskon Rp10rb",
                  style: textTheme.displayMedium?.copyWith(
                      // color: Colors.white,
                      ),
                ),
                Text(
                  "Min.Rp40Rb",
                  style: textTheme.bodySmall?.copyWith(
                      // color: Colors.white,
                      ),
                ),
              ],
            ),
            const SizedBox(width: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 2,
                ),
                // backgroundColor: Colors.green,
              ), // can also use EdgeInsets.zero                  child: Text(
              onPressed: () {},
              child: Text(
                "Klaim",
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class VoucherMiniWidget extends StatelessWidget {
  const VoucherMiniWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = getTextTheme(context);

    return VoucherBaseWidget(
      curvePosition: 8,
      curveRadius: 10,
      borderRadius: 5,
      firstChild: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: [
              PLThemeConstant.pinkSecondary.withOpacity(0.2),
              PLThemeConstant.pinkSecondary.withOpacity(0.5),
              PLThemeConstant.pinkSecondary,
            ],
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Diskon Rp10rb",
                  style: textTheme.bodySmall?.copyWith(
                    // color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Text(
                //   "Min.Rp40Rb",
                //   style: textTheme.bodySmall?.copyWith(
                //       // color: Colors.white,
                //       ),
                // ),
              ],
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

class VoucherBaseWidget extends StatelessWidget {
  /// Creates a vertical coupon card widget that takes two children
  /// with the properties that defines the shape of the card.
  const VoucherBaseWidget({
    Key? key,
    required this.firstChild,
    this.width,
    this.height = 150,
    this.borderRadius = 8,
    this.curveRadius = 20,
    this.curvePosition = 100,
    this.curveAxis = Axis.horizontal,
    this.clockwise = false,
    this.backgroundColor,
    this.decoration,
    this.shadow,
    this.border,
  }) : super(key: key);

  /// The small child or first.
  final Widget firstChild;

  final double? width;

  final double height;

  /// Border radius value.
  final double borderRadius;

  /// The curve radius value, which specifies its size.
  final double curveRadius;

  /// The curve position, which specifies the curve position depending
  /// on the its child's size.
  final double curvePosition;

  /// The direction of the curve, whether it's set vertically or
  /// horizontally.
  final Axis curveAxis;

  /// If `false` (by default), then the border radius will be drawn
  /// inside the child, otherwise outside.
  final bool clockwise;

  /// The background color value.
  ///
  /// Ignored if `decoration` property is used.
  final Color? backgroundColor;

  /// The decoration of the entire widget
  ///
  /// Note: `boxShadow` property in the `BoxDecoration` won't do an effect,
  /// and you should use the `shadow` property of `CouponCard` itself instead.
  final Decoration? decoration;

  /// A shadow applied to the widget.
  ///
  /// Usage
  /// ```dart
  /// CouponCard(
  ///   shadow: BoxShadow(
  ///     color: Colors.black56,
  ///     blurRadius: 10,
  ///   ),
  /// )
  /// ```
  final Shadow? shadow;

  /// A custom border applied to the widget.
  ///
  /// Usage
  /// ```dart
  /// CouponCard(
  ///   border: BorderSide(
  ///     width: 2,
  ///     color: Colors.black,
  ///   ),
  /// )
  /// ```
  final BorderSide? border;

  @override
  Widget build(BuildContext context) {
    final clipper = CouponClipper(
      borderRadius: borderRadius,
      curveRadius: curveRadius,
      curvePosition: curvePosition,
      curveAxis: curveAxis,
      direction: Directionality.of(context),
      clockwise: clockwise,
    );

    return CustomPaint(
      painter: CouponDecorationPainter(
        shadow: shadow,
        border: border,
        clipper: clipper,
      ),
      child: ClipPath(
        clipper: clipper,
        child: firstChild,
      ),
    );
  }
}

/// Clips a widget to the form of a coupon card shape
class CouponClipper extends CustomClipper<Path> {
  /// Paints a coupon shape around any widget.
  ///
  /// Usage:
  /// ```dart
  /// ClipPath(
  ///   clipper: CouponClipper(
  ///     // optional (defaults to TextDirection.ltr), works when
  ///     // curveAxis set to Axis.vertical
  ///     direction: Directionality.of(context),
  ///   ),
  ///   // width and height are important depending on the type
  ///   // of the text direction
  ///   child: Container(
  ///     width: 350,
  ///     height: 400,
  ///     color: Colors.purple,
  ///   ),
  /// ),
  /// ```
  const CouponClipper({
    this.borderRadius = 8,
    this.curveRadius = 20,
    this.curvePosition = 100,
    this.curveAxis = Axis.horizontal,
    this.direction = TextDirection.ltr,
    this.clockwise = false,
  }) : assert(
          curvePosition > borderRadius,
          "'curvePosition' should be greater than the 'borderRadius'",
        );

  /// Border radius value.
  final double borderRadius;

  /// The curve radius value, which specifies its size.
  final double curveRadius;

  /// The curve position, which specifies the curve position depending
  /// on the its child's size.
  final double curvePosition;

  /// The direction of the curve, whether it's set vertically or
  /// horizontally.
  final Axis curveAxis;

  /// If `curveAxis` set to `Axis.vertical`, then direction is useful
  /// for languages like (Ar, Fa, ...).
  final TextDirection direction;

  /// If `false` (by default), then the border radius will be drawn
  /// inside the child, otherwise outside.
  final bool clockwise;

  @override
  Path getClip(Size size) {
    double directionalCurvePosition = curvePosition;

    if (curveAxis == Axis.vertical && direction == TextDirection.rtl) {
      directionalCurvePosition = size.width - curvePosition - curveRadius;
    }

    final Radius arcRadius = Radius.circular(borderRadius);

    // border radius arc points
    final Offset bottomLeftArc = Offset(borderRadius, size.height);
    final Offset bottomRightArc =
        Offset(size.width, size.height - borderRadius);
    final Offset topRightArc = Offset(size.width - borderRadius, 0);
    final Offset topLeftArc = Offset(0, borderRadius);

    final Path path = Path();

    // starting point
    path.moveTo(0, borderRadius - 2);

    // left curve
    if (curveAxis == Axis.horizontal) {
      path.lineTo(0, directionalCurvePosition);
      path.quadraticBezierTo(
        curveRadius / 1.5,
        directionalCurvePosition + (curveRadius / 2),
        0,
        directionalCurvePosition + curveRadius,
      );
    }

    // left line, bottom left arc
    path.lineTo(0, size.height - borderRadius);
    path.arcToPoint(bottomLeftArc, radius: arcRadius, clockwise: clockwise);

    // bottom cuve
    if (curveAxis == Axis.vertical) {
      path.lineTo(directionalCurvePosition, size.height);
      path.quadraticBezierTo(
        directionalCurvePosition + (curveRadius / 2),
        size.height - (curveRadius / 1.5),
        directionalCurvePosition + curveRadius,
        size.height,
      );
    }

    // bottom line, bottom right arc
    path.lineTo(size.width - borderRadius, size.height);
    path.arcToPoint(bottomRightArc, radius: arcRadius, clockwise: clockwise);

    // right curve
    if (curveAxis == Axis.horizontal) {
      path.lineTo(size.width, directionalCurvePosition + curveRadius);
      path.quadraticBezierTo(
        size.width - (curveRadius / 1.5),
        directionalCurvePosition + (curveRadius / 2),
        size.width,
        directionalCurvePosition,
      );
    }

    // right line, top right arc
    path.lineTo(size.width, borderRadius);
    path.arcToPoint(topRightArc, radius: arcRadius, clockwise: clockwise);

    // top curve
    if (curveAxis == Axis.vertical) {
      path.lineTo(directionalCurvePosition + curveRadius, 0);
      path.quadraticBezierTo(
        (directionalCurvePosition - (curveRadius / 2)) + curveRadius,
        curveRadius / 1.5,
        directionalCurvePosition - curveRadius + curveRadius,
        0,
      );
    }

    // top line, top left arc
    path.lineTo(borderRadius, 0);
    path.arcToPoint(topLeftArc, radius: arcRadius, clockwise: clockwise);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => oldClipper != this;
}

class CouponDecorationPainter extends CustomPainter {
  final Shadow? shadow;
  final BorderSide? border;
  final CustomClipper<Path> clipper;

  CouponDecorationPainter({
    this.shadow,
    this.border,
    required this.clipper,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (shadow != null) {
      final paintShadow = shadow!.toPaint();
      final pathShadow = clipper.getClip(size).shift(shadow!.offset);
      canvas.drawPath(pathShadow, paintShadow);
    }

    if (border != null) {
      final paintBorder = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = border!.width
        ..color = border!.color;
      final pathBorder = clipper.getClip(size);
      canvas.drawPath(pathBorder, paintBorder);
    }
  }

  @override
  bool shouldRepaint(CouponDecorationPainter oldDelegate) =>
      this != oldDelegate;

  @override
  bool shouldRebuildSemantics(CouponDecorationPainter oldDelegate) =>
      this != oldDelegate;
}
