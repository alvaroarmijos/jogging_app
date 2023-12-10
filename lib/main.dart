import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/data/device/application.dart';
import 'package:tracking_app/src/pages/loading_page.dart';

import 'src/packages/features/gps_permissions/gps_permissions.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => GpsPermissionsBloc(
        const GpsCurrentStatus(),
        const GpsStatus(),
        const AskGpsAccess(),
        const OpenAppSettings(),
        const CheckPermissionGranted(),
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TrackingThemes.light,
      title: 'Tracking App',
      home: const LoadingPage(),
    );
  }
}
