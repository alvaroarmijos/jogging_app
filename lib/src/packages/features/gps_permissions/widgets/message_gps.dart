import 'package:flutter/material.dart';

import '../../../core/ui/ui.dart';

class MessageGps extends StatelessWidget {
  const MessageGps({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.location_disabled_rounded,
          size: TrackingDimens.dimen_48,
          color: TrackingColors.primary,
        ),
        const SizedBox(
          height: TrackingDimens.dimen_36,
        ),
        Text(
          'Debes activar tu GPS',
          style: textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
