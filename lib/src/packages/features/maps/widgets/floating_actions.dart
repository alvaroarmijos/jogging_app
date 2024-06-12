import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/location_bloc/location_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/map_bloc/map_bloc.dart';

class FloatingActions extends StatelessWidget {
  const FloatingActions({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = context.read<MapBloc>();
    final locationBloc = context.read<LocationBloc>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          onPressed: () => mapBloc.add(const ChangeShowUserRouteEvent()),
          child: const Icon(
            Icons.more_horiz,
          ),
        ),
        FloatingActionButton.small(
          onPressed: () {
            final myCurrentLocation = locationBloc.state.lastKnownLocation;
            if (myCurrentLocation != null) {
              mapBloc.add(const FollowingUserEvent(true));
              mapBloc.moveCamera(myCurrentLocation);
            }
          },
          child: const Icon(
            Icons.my_location_rounded,
          ),
        ),
      ],
    );
  }
}
