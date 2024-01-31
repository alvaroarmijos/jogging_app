import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

class MapView extends StatelessWidget {
  const MapView({
    super.key,
    required this.initialLocation,
    required this.polylines,
  });

  final LatLng initialLocation;
  final Set<Polyline> polylines;

  @override
  Widget build(BuildContext context) {
    final mapBloc = context.read<MapBloc>();

    return Listener(
      onPointerMove: (event) => mapBloc.add(const FollowingUserEvent(false)),
      child: GoogleMap(
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: initialLocation,
          zoom: 17,
        ),
        onMapCreated: (controller) =>
            mapBloc.add(MapInitializedEvent(controller)),
        polylines: polylines,
        onCameraMove: (position) => mapBloc.mapCenter = position.target,
      ),
    );
  }
}
