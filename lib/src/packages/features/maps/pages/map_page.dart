import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/features/maps/location_bloc/location_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/map_bloc/map_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/widgets/map_view.dart';

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
    mapBloc = context.read<MapBloc>();
    locationBloc = context.read<LocationBloc>()
      ..add(const InitialLocationEvent())
      ..add(const StartTrackingUserEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LocationBloc, LocationState>(
        listener: (context, locationState) {
          if (locationState.lastKnownLocation != null) {
            mapBloc
                .add(UpdateUserPolylineEvent(locationState.myLocationHistory));

            if (mapBloc.state.isFollowingUser) {
              mapBloc.moveCamera(locationState.lastKnownLocation!);
            }
          }
        },
        builder: (context, state) {
          if (state.lastKnownLocation == null) {
            return const Center(
              child: Text('Espere por favor...'),
            );
          }

          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              Map<String, Polyline> polylines = Map.from(mapState.polylines);

              if (!mapState.showMyRoute) {
                polylines.removeWhere((key, poyline) => key == 'myRoute');
              }

              return MapView(
                lastKnownLocation: state.lastKnownLocation!,
                polylines: polylines.values.toSet(),
              );
            },
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            onPressed: () => mapBloc.add(const ChangeShowUserRouteEvent()),
            child: const Icon(
              Icons.more_horiz,
            ),
          ),
          FloatingActionButton.small(
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
      ),
    );
  }
}
