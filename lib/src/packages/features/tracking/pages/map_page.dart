import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    context.read<LocationBloc>().add(const StartTrackingUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Page'),
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.lastKownLocation == null) {
            return const Center(
              child: Text('Espere por favor'),
            );
          }

          return Center(
            child: Text(
                '${state.lastKownLocation!.latitude}, ${state.lastKownLocation!.longitude}'),
          );
        },
      ),
    );
  }
}
