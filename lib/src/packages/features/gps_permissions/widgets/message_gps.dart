import 'package:flutter/material.dart';
import 'package:tracking_app/src/packages/core/ui/colors.dart';
import 'package:tracking_app/src/packages/core/ui/dimens.dart';

class MessageGps extends StatelessWidget {
  const MessageGps({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_disabled_rounded,
            size: AppDimens.dimen_48,
            color: AppColors.primary,
          ),
          const SizedBox(
            height: AppDimens.dimen_24,
          ),
          const Text('Debes activar tu GPS.'),
        ],
      ),
    );
  }
}
