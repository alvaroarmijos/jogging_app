import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/lib/src/widgets/custom_snackbar.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final MapBloc mapBloc;
  late final LocationBloc locationBloc;

  @override
  void initState() {
    locationBloc = context.read<LocationBloc>()
      ..add(const StartTrackingUserEvent());
    mapBloc = context.read<MapBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.lastKownLocation == null) {
            return const Center(
              child: Text('Espere por favor'),
            );
          }

          return Listener(
            onPointerMove: (event) =>
                mapBloc.add(const FollowingUserEvent(false)),
            child: GoogleMap(
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: state.lastKownLocation!,
                zoom: 15,
              ),
              onMapCreated: (controller) =>
                  mapBloc.add(MapInitializedEvent(controller)),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.small(
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
    );
  }
}