import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/bloc/gps_permission_bloc.dart';

class EnableGps extends StatelessWidget {
  const EnableGps({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(
        AppDimens.dimen_20,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppDrawables.getEnableGpsDrawable(),
              width: 150,
            ),
            const SizedBox(
              height: AppDimens.dimen_36,
            ),
            Text(
              'Ubicación',
              style: theme.titleLarge,
            ),
            const SizedBox(
              height: AppDimens.dimen_12,
            ),
            Text(
              'Necesitamos acceder a tu ubicación para mostrate tus rutas e información de tu rendimiento.',
              style: theme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: AppDimens.dimen_24,
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<GpsPermissionBloc>()
                    .add(const AskGpsAccessEvent());
              },
              child: const Text('Solicitar Permisos'),
            ),
          ],
        ),
      ),
    );
  }
}
