import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/location_bloc/location_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/map_bloc/map_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/widgets/widgets.dart';

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

              return Stack(
                children: [
                  MapView(
                    lastKnownLocation: state.lastKnownLocation!,
                    polylines: polylines.values.toSet(),
                  ),
                  const SearchbarIcon(),
                  const ManualMarker(),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: const FloatingActions(),
    );
  }
}
