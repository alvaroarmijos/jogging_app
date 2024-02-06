import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

class RunningInfo extends StatelessWidget {
  const RunningInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        return Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _RunningInfoItem(
                iconPath: TrackingDrawables.getRunningIcon(),
                data: '0.0',
                label: 'km',
              ),
              const VerticalDivider(),
              _RunningInfoItem(
                iconPath: TrackingDrawables.getFireIcon(),
                data: '0',
                label: 'Kcal',
              ),
              const VerticalDivider(),
              _RunningInfoItem(
                iconPath: TrackingDrawables.getVelocityIcon(),
                data: state.speed.toString(),
                label: 'km/h',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RunningInfoItem extends StatelessWidget {
  const _RunningInfoItem({
    super.key,
    required this.data,
    required this.label,
    required this.iconPath,
  });

  final String data;
  final String label;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath),
          const SizedBox(
            width: TrackingDimens.dimen_12,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data,
                style: textTheme.titleMedium,
              ),
              Text(
                label,
                style: textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
