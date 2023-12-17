import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

class EndUberMarkerPainter extends CustomPainter {
  EndUberMarkerPainter({
    super.repaint,
    required this.kilometers,
    required this.destination,
  });

  final int kilometers;
  final String destination;

  @override
  void paint(Canvas canvas, Size size) {
    final purplePaint = Paint()..color = TrackingColors.primary;
    final whitePaint = Paint()..color = Colors.white;

    const double circlePurpleRadius = 20;
    const double circleWhiteRadius = 7;

    //Purple circle
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height - circlePurpleRadius),
      circlePurpleRadius,
      purplePaint,
    );

    //Circle white
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height - circlePurpleRadius),
      circleWhiteRadius,
      whitePaint,
    );

    //Draw white box
    final path = Path();
    path.moveTo(10, 20);
    path.lineTo(size.width - 10, 20);
    path.lineTo(size.width - 10, 100);
    path.lineTo(10, 100);

    //Shadow
    canvas.drawShadow(path, Colors.black, 10, false);

    //Box
    canvas.drawPath(path, whitePaint);

    //Purple Box
    const purpleBox = Rect.fromLTWH(10, 20, 70, 80);
    canvas.drawRect(purpleBox, purplePaint);

    //Texts
    //kilometers
    final textSpan = TextSpan(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w400,
      ),
      text: "$kilometers",
    );

    final kilometersPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(
        minWidth: 70,
        maxWidth: 70,
      );

    kilometersPainter.paint(canvas, const Offset(10, 35));

    //Word MIN

    const minTextSpan = TextSpan(
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
      text: 'kms',
    );

    final minPainter = TextPainter(
        text: minTextSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(
        minWidth: 70,
        maxWidth: 70,
      );

    minPainter.paint(canvas, const Offset(10, 68));

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
        minWidth: size.width - 95,
        maxWidth: size.width - 95,
      );

    final double offsetY = (destination.length > 28) ? 40 : 50;

    locationPainter.paint(canvas, Offset(90, offsetY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
