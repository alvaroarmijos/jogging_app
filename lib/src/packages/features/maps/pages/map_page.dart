import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/features/maps/location_bloc/location_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/map_bloc/map_bloc.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    context.read<LocationBloc>()
      ..add(const InitialLocationEvent())
      ..add(const StartTrackingUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state.lastKnownLocation == null) {
          return const Center(
            child: Text('Espere por favor...'),
          );
        }
        return GoogleMap(
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(
            target: state.lastKnownLocation!,
            zoom: 18,
          ),
          onMapCreated: (controller) {
            context.read<MapBloc>().add(MapInitializeEvent(controller));
          },
        );
      },
    ));
  }
}
