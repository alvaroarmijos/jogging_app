import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/data/device/application/application.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/bloc/gps_permission_bloc.dart';
import 'package:tracking_app/src/pages/loading_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.light,
        title: 'Tracking App',
        home: BlocProvider(
          create: (context) => GpsPermissionBloc(
            const GpsInitialStatus(),
            const GpsStatus(),
            const AskGpsPermissions(),
            const OpenAppSettings(),
            const CheckPermissions(),
          ),
          child: const LoadingPage(),
        ));
  }
}
