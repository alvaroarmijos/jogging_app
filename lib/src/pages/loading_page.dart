import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/gps_permissions.dart';
import 'package:tracking_app/src/pages/pages.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsPermissionsBloc, GpsPermissionsState>(
        builder: (context, state) {
          return state.isAllGranted ? const MapPage() : const GpsPage();
        },
      ),
    );
  }
}
