import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/bloc/gps_permission_bloc.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/pages/gps_page.dart';
import 'package:tracking_app/src/pages/pages.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsPermissionBloc, GpsPermissionState>(
        builder: (context, state) {
          if (state.isAllEnabled) {
            return const MapPage();
          } else {
            return const GpsPage();
          }
        },
      ),
    );
  }
}
