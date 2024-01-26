import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        builder: (context, locationState) {
          if (locationState.lastKnownLocation == null) {
            return const Center(
              child: Text('Espere por favor ...'),
            );
          }

          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              return MapView(
                  initialLocation: locationState.lastKnownLocation!,
                  polylines: mapState.polylines.values.toSet());
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
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
    );
  }
}
