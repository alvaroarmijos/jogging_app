import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/colors.dart';

class StartUberMarker extends CustomPainter {
  final int minutes;
  final String description;

  StartUberMarker({
    required this.minutes,
    required this.description,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const circlePurpleRadius = 20.0;
    const circlePurpleWhite = 7.0;
    //Pencil

    final purplePaint = Paint()..color = TrackingColors.primary;
    final whitePaint = Paint()..color = Colors.white;

    // Purple circle
    canvas.drawCircle(
      Offset(circlePurpleRadius, size.height - circlePurpleRadius),
      circlePurpleRadius,
      purplePaint,
    );

    // White circle
    canvas.drawCircle(
      Offset(circlePurpleRadius, size.height - circlePurpleRadius),
      circlePurpleWhite,
      whitePaint,
    );

    // Draw white box
    final path = Path();
    path.moveTo(40, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(40, 100);

    // Shadow
    canvas.drawShadow(path, Colors.black, 10, false);

    //Box
    canvas.drawPath(path, whitePaint);

    // Purple box
    const purpleBox = Rect.fromLTWH(40, 20, 70, 80);
    canvas.drawRect(purpleBox, purplePaint);

    // Textos

    // Minutos
    final textSpan = TextSpan(
      text: minutes.toString(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
    );

    final minutesPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(
        minWidth: 70,
        maxWidth: 70,
      );

    minutesPainter.paint(canvas, const Offset(40, 35));

    const minutesTextSpan = TextSpan(
        text: "min",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ));

    final minPainter = TextPainter(
      text: minutesTextSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(
        minWidth: 70,
        maxWidth: 70,
      );

    minPainter.paint(canvas, const Offset(40, 68));

    //Description
    final locationTextSpan = TextSpan(
        text: description,
        style: TextStyle(
            color: TrackingColors.primary,
            fontSize: 18,
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

    final double offsetY = (description.length > 20) ? 40 : 48;

    locationPainter.paint(canvas, Offset(120, offsetY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
