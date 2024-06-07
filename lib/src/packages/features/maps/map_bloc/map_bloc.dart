import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<MapInitializeEvent>(_onMapInitializeEvent);
  }

  GoogleMapController? _mapController;

  FutureOr<void> _onMapInitializeEvent(
    MapInitializeEvent event,
    Emitter<MapState> emit,
  ) {
    _mapController = event.controller;
    _mapController?.setMapStyle(jsonEncode(mapStyle));
    emit(state.copyWith(isMapInitialized: true));
  }
}
