import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/colors.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

class EndUberMarker extends CustomPainter {
  final int kilometers;
  final String place;

  EndUberMarker({
    super.repaint,
    required this.kilometers,
    required this.place,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final purplePaint = Paint()..color = AppColors.primary;
    final whitePaint = Paint()..color = Colors.white;

    const circleRadiusPurple = 20.0;
    const circleRadiusWhite = 8.0;

    // Purple circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height - circleRadiusPurple),
      circleRadiusPurple,
      purplePaint,
    );

    // White circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height - circleRadiusPurple),
      circleRadiusWhite,
      whitePaint,
    );

    // Box white
    final path = Path();
    path.moveTo(10, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(10, 100);

    // Shadow
    canvas.drawShadow(path, Colors.black, 10, false);

    // Box
    canvas.drawPath(path, whitePaint);

    // Box purple
    const purpleBox = Rect.fromLTWH(10, 20, 70, 80);
    canvas.drawRect(purpleBox, purplePaint);

    // Textos

    // Minutos
    final textSpan = TextSpan(
      text: kilometers.toString(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
    );

    final minutesPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: 70,
        maxWidth: 70,
      );

    minutesPainter.paint(canvas, const Offset(10, 40));

    // Min
    const minTextSpan = TextSpan(
      text: 'kms',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
    );

    final minPainter = TextPainter(
      text: minTextSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: 70,
        maxWidth: 70,
      );

    minPainter.paint(canvas, const Offset(12, 70));

    // Place
    final placeTextSpan = TextSpan(
      text: place,
      style: TextStyle(
        color: AppColors.primary,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    );

    final placePainter = TextPainter(
        text: placeTextSpan,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        maxLines: 2,
        ellipsis: '...')
      ..layout(
        minWidth: size.width - 130,
        maxWidth: size.width - 130,
      );

    final double offsetY = (place.length > 20) ? 40 : 48;

    placePainter.paint(canvas, Offset(90, offsetY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) {
    return true;
  }
}
