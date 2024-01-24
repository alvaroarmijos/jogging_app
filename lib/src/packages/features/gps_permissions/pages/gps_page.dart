import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/gps_permissions.dart';

import '../../../core/ui/ui.dart';
import '../widgets/widgets.dart';

class GpsPage extends StatelessWidget {
  const GpsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: TrackingDimens.dimen_20,
            ),
            child: BlocBuilder<GpsPermissionsBloc, GpsPermissionsState>(
              builder: (context, state) {
                return !state.isGpsEnabled
                    ? const MessageGps()
                    : EnableGps(
                        onTap: () {},
                      );
              },
            )),
      ),
    );
  }
}
