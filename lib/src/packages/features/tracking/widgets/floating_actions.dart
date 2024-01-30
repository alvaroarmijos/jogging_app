import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tracking.dart';

class FloatingActions extends StatelessWidget {
  const FloatingActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return (state.showManualMarker)
          ? const SizedBox()
          : const _FloatingActionsView();
    });
  }
}

class _FloatingActionsView extends StatelessWidget {
  const _FloatingActionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = context.read<MapBloc>();
    final locationBloc = context.read<LocationBloc>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          heroTag: const Key('more'),
          onPressed: () => mapBloc.add(const ChangeShowUserRouteEvent()),
          child: const Icon(Icons.more_horiz),
        ),
        FloatingActionButton.small(
          heroTag: const Key('location'),
          onPressed: () {
            final userLocation = locationBloc.state.lastKnownLocation;

            if (userLocation == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No hay ubicaciion')));
            }
            mapBloc.add(const FollowingUserEvent(true));
            mapBloc.moveCamera(userLocation!);
          },
          child: const Icon(Icons.my_location),
        ),
      ],
    );
  }
}
