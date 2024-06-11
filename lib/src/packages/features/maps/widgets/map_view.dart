import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/features/maps/map_bloc/map_bloc.dart';

class MapView extends StatelessWidget {
  const MapView({
    super.key,
    required this.lastKnownLocation,
    required this.polylines,
  });

  final LatLng lastKnownLocation;
  final Set<Polyline> polylines;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (_) =>
          context.read<MapBloc>().add(const FollowingUserEvent(false)),
      child: GoogleMap(
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: lastKnownLocation,
          zoom: 17,
        ),
        onMapCreated: (controller) {
          context.read<MapBloc>().add(MapInitializeEvent(controller));
        },
        polylines: polylines,
      ),
    );
  }
}
