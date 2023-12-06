import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';

class EnableGps extends StatelessWidget {
  const EnableGps({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          TrackingDrawables.getEnableGpsDrawable(),
          width: 150,
        ),
        const SizedBox(
          height: TrackingDimens.dimen_36,
        ),
        Text(
          'Ubicación',
          style: textTheme.titleLarge,
        ),
        const SizedBox(
          height: TrackingDimens.dimen_12,
        ),
        Text(
          'Necesitamos acceder a tu ubicación para mostrate tus rutas e información de tu rendimiento.',
          style: textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TrackingDimens.dimen_24,
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: const Text("Activar GPS"),
        )
      ],
    );
  }
}
