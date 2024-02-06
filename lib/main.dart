import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/app/di/di.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/gps_permissions.dart';

import 'src/packages/core/ui/ui.dart';
import 'src/packages/features/tracking/tracking.dart';
import 'src/pages/loading_page.dart';

void main() async {
  await init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl<LocationBloc>(),
      ),
      BlocProvider(create: (context) => sl<SearchBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TrackingThemes.light,
      title: 'Tracking App',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<GpsPermissionsBloc>(),
          ),
          BlocProvider(
            create: (context) => MapBloc(
              context.read<LocationBloc>(),
              context.read<SearchBloc>(),
            ),
          ),
        ],
        child: const LoadingPage(),
        // child: const TestMarkerPage(),
      ),
    );
  }
}
