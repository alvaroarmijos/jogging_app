import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/markers/end_cabify_marker.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          width: 350,
          height: 150,
          child: CustomPaint(
            painter: EndCabifyMarker(
              place: 'Coliseo',
            ),
          ),
        ),
      ),
    );
  }
}
