import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/device/application/application.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(
    this._getInitialPosition,
    this._gpsPositionStream,
  ) : super(const LocationState()) {
    on<InitialLocationEvent>(_onInitialLocationEvent);
    on<StartTrackingUserEvent>(_onStartTrackingUserEvent);
    on<NewUserLocationEvent>(_onNewUserLocationEvent);
  }

  final GetInitialPosition _getInitialPosition;
  final GpsPositionStream _gpsPositionStream;

  FutureOr<void> _onInitialLocationEvent(
    InitialLocationEvent event,
    Emitter<LocationState> emit,
  ) {
    return emit.forEach(
      _getInitialPosition(),
      onData: (position) {
        return state.copyWith(
            lastKnownLocation: LatLng(position.latitude, position.longitude));
      },
    );
  }

  FutureOr<void> _onStartTrackingUserEvent(
    StartTrackingUserEvent event,
    Emitter<LocationState> emit,
  ) {
    return emit.onEach(_gpsPositionStream(), onData: (position) {
      add(NewUserLocationEvent(LatLng(position.latitude, position.longitude)));
    });
  }

  FutureOr<void> _onNewUserLocationEvent(
    NewUserLocationEvent event,
    Emitter<LocationState> emit,
  ) {
    emit(state
        .copyWith(lastKnownLocation: event.newLocation, myLocationHistory: [
      ...state.myLocationHistory,
      event.newLocation,
    ]));
  }
}
