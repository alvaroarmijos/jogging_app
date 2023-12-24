import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/app/bloc/app_bloc.dart';
import 'package:tracking_app/app/navigator/onboarding_navigator.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';
import 'package:tracking_app/src/pages/pages.dart';

import 'app/di/injection_container.dart' as di;
import 'src/packages/features/gps_permissions/gps_permissions.dart';

void main() async {
  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                di.sl<AppBloc>()..add(const CheckExistUserEvent())),
        BlocProvider(create: (context) => di.sl<GpsPermissionsBloc>()),
        BlocProvider(create: (context) => di.sl<LocationBloc>()),
        BlocProvider(create: (context) => di.sl<SearchBloc>()),
        //It's important register the LocationBloc in this way
        //to track the user location and move the camera
        BlocProvider(
            create: (context) => MapBloc(
                context.read<LocationBloc>(), context.read<SearchBloc>())),
      ],
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
      home: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return state.userExists
              ? const LoadingPage()
              : const OnboardingNavigator();
        },
      ),
    );
  }
}
