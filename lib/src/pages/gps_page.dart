import 'package:flutter/material.dart';
import 'package:tracking_app/src/ui/ui.dart';

import '../widgets/widgets.dart';

class GpsPage extends StatelessWidget {
  const GpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: TrackingDimens.dimen_20,
          ),
          child: EnableGps(),
        ),
      ),
    );
  }
}
