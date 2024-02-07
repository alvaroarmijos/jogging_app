import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

class RunningInfo extends StatelessWidget {
  const RunningInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TrackingDimens.dimen_8),
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemInfo(
                  icon: TrackingDrawables.getRunningDrawable(),
                  label: 'km',
                  value: state.distance.toStringAsFixed(2),
                ),
                const VerticalDivider(),
                ItemInfo(
                  icon: TrackingDrawables.getFireDrawable(),
                  label: 'kcal',
                  value: state.kcal.toStringAsFixed(1),
                ),
                const VerticalDivider(),
                ItemInfo(
                  icon: TrackingDrawables.getVelocityDrawable(),
                  label: 'km/hr',
                  value: state.speedInKiometers.toStringAsFixed(1),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final String icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon),
          const SizedBox(width: TrackingDimens.dimen_12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: textTheme.titleMedium,
              ),
              Text(
                label,
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
