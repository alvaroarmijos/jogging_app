import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/app/di/injection_container.dart' as di;
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/bloc/gps_permission_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/location_bloc/location_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/map_bloc/map_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/search_bloc/search_bloc.dart';
import 'package:tracking_app/src/pages/loading_page.dart';

void main() {
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.light,
        title: 'Tracking App',
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => di.sl<GpsPermissionBloc>(),
            ),
            BlocProvider(
              create: (_) => di.sl<LocationBloc>(),
            ),
            BlocProvider(
              create: (_) => di.sl<MapBloc>(),
            ),
            BlocProvider(
              create: (_) => di.sl<SearchBloc>(),
            ),
          ],
          child: const LoadingPage(),
        ));
  }
}
