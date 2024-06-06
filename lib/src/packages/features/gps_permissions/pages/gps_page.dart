import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/bloc/gps_permission_bloc.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/widgets/widgets.dart';

class GpsPage extends StatelessWidget {
  const GpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: false ? MessageGps() : EnableGps(),
      body: BlocBuilder<GpsPermissionBloc, GpsPermissionState>(
        builder: (context, state) {
          if (state.isGpsEnable) {
            return const EnableGps();
          } else {
            return const MessageGps();
          }
        },
      ),
    );
  }
}
