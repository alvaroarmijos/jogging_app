import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

class StartUberMarkerPainter extends CustomPainter {
  StartUberMarkerPainter({
    super.repaint,
    required this.minutes,
    required this.destination,
  });

  final int minutes;
  final String destination;

  @override
  void paint(Canvas canvas, Size size) {
    final purplePaint = Paint()..color = TrackingColors.primary;
    final whitePaint = Paint()..color = Colors.white;

    const double circlePurpleRadius = 20;
    const double circleWhiteRadius = 7;

    //Purple circle
    canvas.drawCircle(
      Offset(circlePurpleRadius, size.height - circlePurpleRadius),
      circlePurpleRadius,
      purplePaint,
    );

    //Circle white
    canvas.drawCircle(
      Offset(circlePurpleRadius, size.height - circlePurpleRadius),
      circleWhiteRadius,
      whitePaint,
    );

    //Draw white box
    final path = Path();
    path.moveTo(40, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(40, 100);

    //Shadow
    canvas.drawShadow(path, Colors.black, 10, false);

    //Box
    canvas.drawPath(path, whitePaint);

    //Purple Box
    const purpleBox = Rect.fromLTWH(40, 20, 70, 80);
    canvas.drawRect(purpleBox, purplePaint);

    //Texts
    //Minutes
    final textSpan = TextSpan(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
      text: "$minutes",
    );

    final minutesPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(
        minWidth: 70,
        maxWidth: 70,
      );

    minutesPainter.paint(canvas, const Offset(40, 35));

    //Word MIN

    const minTextSpan = TextSpan(
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
      text: 'min',
    );

    final minPainter = TextPainter(
        text: minTextSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(
        minWidth: 70,
        maxWidth: 70,
      );

    minPainter.paint(canvas, const Offset(40, 68));

    //Description
    final locationTextSpan = TextSpan(
      style: TextStyle(
        color: TrackingColors.primary,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      text: destination,
    );

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

    final double offsetY = (destination.length > 20) ? 40 : 48;

    locationPainter.paint(canvas, Offset(120, offsetY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
