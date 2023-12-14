import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

import '../tracking.dart';

class FloatingActions extends StatelessWidget {
  const FloatingActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return (state.showManulMarker)
            ? const SizedBox()
            : const _FloatingActionsView();
      },
    );
  }
}

class _FloatingActionsView extends StatelessWidget {
  const _FloatingActionsView();

  @override
  Widget build(BuildContext context) {
    final locationBloc = context.read<LocationBloc>();
    final mapBloc = context.read<MapBloc>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          heroTag: 'route',
          onPressed: () => mapBloc.add(const ChangeShowUserRouteEvent()),
          child: const Icon(Icons.more_horiz),
        ),
        FloatingActionButton.small(
          heroTag: 'my_location',
          onPressed: () {
            final userLocation = locationBloc.state.lastKownLocation;
            if (userLocation == null) {
              final snackBar = CustomSnackbar(message: 'No hay ubicacion');
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              return;
            }
            mapBloc.add(const FollowingUserEvent(true));
            mapBloc.moveCamera(userLocation);
          },
          child: const Icon(Icons.my_location),
        ),
      ],
    );
  }
}
