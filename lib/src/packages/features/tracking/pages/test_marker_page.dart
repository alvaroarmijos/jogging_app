import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

class TestMarkerPage extends StatelessWidget {
  const TestMarkerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 150,
          width: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: EndCabifyMarker(
              description: 'Supermaxi',
            ),
          ),
        ),
      ),
    );
  }
}
