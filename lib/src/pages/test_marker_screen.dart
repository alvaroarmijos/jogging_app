import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

class TestMarkerScreen extends StatelessWidget {
  const TestMarkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          height: 150,
          width: 250,
          child: CustomPaint(
            painter: EndMarkerPainter(
              destination: 'Supermaxi',
            ),
          ),
        ),
      ),
    );
  }
}
