import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc(this.locationBloc) : super(const MapState()) {
    on<MapInitializedEvent>(_onMapInitializedEvent);

    locationBloc.stream.listen((locationState) {
      if (locationState.lastKownLocation == null) return;
      moveCamera(locationState.lastKownLocation!);
    });
  }

  GoogleMapController? _mapController;

  final LocationBloc locationBloc;

  FutureOr<void> _onMapInitializedEvent(
    MapInitializedEvent event,
    Emitter<MapState> emit,
  ) {
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(mapStyle));
    emit(state.copyWith(isMapInitialized: true));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }
}
