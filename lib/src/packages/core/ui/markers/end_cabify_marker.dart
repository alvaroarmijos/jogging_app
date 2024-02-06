import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/colors.dart';

class EndCabifyMarker extends CustomPainter {
  final String description;

  EndCabifyMarker({
    required this.description,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const circlePurpleRadius = 20.0;
    //Pencil

    final purplePaint = Paint()..color = TrackingColors.primary;
    final whitePaint = Paint()..color = Colors.white;

    // Purple circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height - circlePurpleRadius),
      circlePurpleRadius,
      purplePaint,
    );

    // Draw white box
    final boxRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(10, 20, size.width - 20, size.height / 2),
      const Radius.circular(15),
    );

    final path = Path();
    path.addRRect(boxRect);

    // Shadow
    canvas.drawShadow(path, Colors.black, 10, false);

    //Box
    canvas.drawRRect(boxRect, whitePaint);

    // Textos

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
        textAlign: TextAlign.center)
      ..layout(
        minWidth: size.width - 30,
        maxWidth: size.width - 30,
      );

    final double offsetY = (description.length > 20) ? 33 : 48;

    locationPainter.paint(canvas, Offset(15, offsetY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
