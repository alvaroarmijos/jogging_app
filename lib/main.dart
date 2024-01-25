import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/data/device/application.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/gps_permissions.dart';

import 'src/packages/core/ui/ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TrackingThemes.light,
      title: 'Tracking App',
      home: BlocProvider(
        create: (context) => GpsPermissionsBloc(
          const GpsInitialStatus(),
          const GpsStatus(),
        ),
        child: const GpsPage(),
      ),
    );
  }
}
