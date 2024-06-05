import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/widgets/widgets.dart';

class GpsPage extends StatelessWidget {
  const GpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: false ? MessageGps() : EnableGps(),
    );
  }
}
