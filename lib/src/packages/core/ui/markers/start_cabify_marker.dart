import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/colors.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

class StartCabifyMarker extends CustomPainter {
  final String place;

  StartCabifyMarker({
    super.repaint,
    required this.place,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final purplePaint = Paint()..color = AppColors.primary;
    final whitePaint = Paint()..color = Colors.white;

    const circleRadiusPurple = 20.0;

    // Purple circle
    canvas.drawCircle(
      Offset(size.width - circleRadiusPurple, size.height - circleRadiusPurple),
      circleRadiusPurple,
      purplePaint,
    );

    // Box white
    final boxRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(10, 20, size.width - 40, size.height / 2),
      const Radius.circular(15),
    );

    final path = Path();
    path.addRRect(boxRect);

    // Shadow
    canvas.drawShadow(path, Colors.black, 10, false);

    // Box
    canvas.drawRRect(boxRect, whitePaint);

    // Textos

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
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        maxLines: 2,
        ellipsis: '...')
      ..layout(
        minWidth: size.width - 60,
        maxWidth: size.width - 60,
      );

    final double offsetY = (place.length > 20) ? 38 : 45;

    placePainter.paint(canvas, Offset(15, offsetY));
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
