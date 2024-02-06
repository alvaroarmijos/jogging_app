import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/colors.dart';

class EndUberMarker extends CustomPainter {
  final int kilometers;
  final String description;

  EndUberMarker({
    required this.kilometers,
    required this.description,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const circlePurpleRadius = 20.0;
    const circleWhiteRadius = 7.0;
    //Pencil

    final purplePaint = Paint()..color = TrackingColors.primary;
    final whitePaint = Paint()..color = Colors.white;

    // Purple circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height - circlePurpleRadius),
      circlePurpleRadius,
      purplePaint,
    );

    // White circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height - circlePurpleRadius),
      circleWhiteRadius,
      whitePaint,
    );

    // Draw white box
    final path = Path();
    path.moveTo(10, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(10, 100);

    // Shadow
    canvas.drawShadow(path, Colors.black, 10, false);

    //Box
    canvas.drawPath(path, whitePaint);

    // Purple box
    const purpleBox = Rect.fromLTWH(10, 20, 70, 80);
    canvas.drawRect(purpleBox, purplePaint);

    // Textos

    // Kilometros
    final textSpan = TextSpan(
      text: kilometers.toString(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
    );

    final kilometersPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(
        minWidth: 70,
        maxWidth: 70,
      );

    kilometersPainter.paint(canvas, const Offset(10, 30));

    const kilometersTextSpan = TextSpan(
        text: "km",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w300,
        ));

    final minPainter = TextPainter(
      text: kilometersTextSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(
        minWidth: 70,
        maxWidth: 70,
      );

    minPainter.paint(canvas, const Offset(10, 65));

    //Description
    final locationTextSpan = TextSpan(
        text: description,
        style: TextStyle(
            color: TrackingColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.w400));

    final locationPainter = TextPainter(
        maxLines: 2,
        ellipsis: '...',
        text: locationTextSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left)
      ..layout(
        minWidth: size.width - 135,
        maxWidth: size.width - 135,
      );

    final double offsetY = (description.length > 20) ? 32 : 48;

    locationPainter.paint(canvas, Offset(90, offsetY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
