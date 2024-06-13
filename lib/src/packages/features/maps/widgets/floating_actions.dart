import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/location_bloc/location_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/map_bloc/map_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/search_bloc/search_bloc.dart';

class FloatingActions extends StatelessWidget {
  const FloatingActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return state.showManualMarker
          ? const SizedBox()
          : const FloatingActionsView();
    });
  }
}

class FloatingActionsView extends StatelessWidget {
  const FloatingActionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = context.read<MapBloc>();
    final locationBloc = context.read<LocationBloc>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          heroTag: 'more_horiz',
          onPressed: () => mapBloc.add(const ChangeShowUserRouteEvent()),
          child: const Icon(
            Icons.more_horiz,
          ),
        ),
        FloatingActionButton.small(
          heroTag: 'my_location_rounded',
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
