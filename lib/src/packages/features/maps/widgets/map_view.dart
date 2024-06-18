import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/map_bloc/map_bloc.dart';

class MapView extends StatelessWidget {
  const MapView({
    super.key,
    required this.lastKnownLocation,
    required this.polylines,
    required this.markers,
  });

  final LatLng lastKnownLocation;
  final Set<Polyline> polylines;
  final Set<Marker> markers;
  @override
  Widget build(BuildContext context) {
    final mapBloc = context.read<MapBloc>();

    return Listener(
      onPointerMove: (_) => mapBloc.add(const FollowingUserEvent(false)),
      child: GoogleMap(
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(
          target: lastKnownLocation,
          zoom: 17,
        ),
        onCameraMove: (position) => mapBloc.mapCenter = position.target,
        onMapCreated: (controller) {
          context.read<MapBloc>().add(MapInitializeEvent(controller));
        },
        polylines: polylines,
        markers: markers,
      ),
    );
  }
}
