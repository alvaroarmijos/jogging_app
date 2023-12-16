import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../tracking.dart';

class MapView extends StatelessWidget {
  const MapView({
    super.key,
    required this.initialLocation,
    required this.polylines,
    required this.markers,
  });

  final LatLng initialLocation;
  final Set<Polyline> polylines;
  final Set<Marker> markers;

  @override
  Widget build(BuildContext context) {
    final mapBloc = context.read<MapBloc>();

    return Listener(
      onPointerMove: (event) => mapBloc.add(const FollowingUserEvent(false)),
      child: GoogleMap(
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        polylines: polylines,
        markers: markers,
        initialCameraPosition: CameraPosition(
          target: initialLocation,
          zoom: 15,
        ),
        onMapCreated: (controller) =>
            mapBloc.add(MapInitializedEvent(controller)),
        onCameraMove: (position) => mapBloc.mapCenter = position.target,
      ),
    );
  }
}
