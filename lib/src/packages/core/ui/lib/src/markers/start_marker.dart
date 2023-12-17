import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

class StartMarkerPainter extends CustomPainter {
  StartMarkerPainter({
    super.repaint,
    required this.destination,
  });

  final String destination;

  @override
  void paint(Canvas canvas, Size size) {
    final purplePaint = Paint()..color = TrackingColors.primary;
    final whitePaint = Paint()..color = Colors.white;

    const double circlePurpleRadius = 20;

    //Purple circle
    canvas.drawCircle(
      Offset(size.width - circlePurpleRadius, size.height - circlePurpleRadius),
      circlePurpleRadius,
      purplePaint,
    );

    //Draw white box
    final path = Path();

    final boxRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        10,
        20,
        size.width - 40,
        size.height / 2,
      ),
      const Radius.circular(15.0),
    );

    path.addRRect(boxRect);

    //Shadow
    canvas.drawShadow(path, Colors.black, 10, false);

    canvas.drawRRect(
      boxRect,
      whitePaint,
    );

    //Box
    canvas.drawPath(path, whitePaint);

    //Text

    //Description
    final locationTextSpan = TextSpan(
      style: TextStyle(
        color: TrackingColors.primary,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      text: destination,
    );

    final locationPainter = TextPainter(
        maxLines: 2,
        ellipsis: '...',
        text: locationTextSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center)
      ..layout(
        minWidth: size.width - 60,
        maxWidth: size.width - 60,
      );

    final double offsetY = (destination.length > 20) ? 35 : 46;

    locationPainter.paint(canvas, Offset(15, offsetY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
