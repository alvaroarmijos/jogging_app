import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:tracking_app/src/packages/data/device/application.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(
    this._getCurrentPosition,
    this._getPositionStream,
  ) : super(const LocationState()) {
    on<GetCurrentPositionEvent>(_onGetCurrentPositionEvent);
    on<StartTrackingUserEvent>(_onStartTrackingUserEvent);
    on<NewUserLocationEvent>(_onNewUserLocationEvent);
  }

  final GetCurrentPosition _getCurrentPosition;
  final GetPositionStream _getPositionStream;

  FutureOr<void> _onGetCurrentPositionEvent(
    GetCurrentPositionEvent event,
    Emitter<LocationState> emit,
  ) {
    return emit.forEach(_getCurrentPosition(), onData: (data) {
      print(
        "${data.latitude} ${data.longitude}",
      );
      return const LocationState();
    });
  }

  FutureOr<void> _onStartTrackingUserEvent(
    StartTrackingUserEvent event,
    Emitter<LocationState> emit,
  ) {
    return emit.onEach(
      _getPositionStream(),
      onData: (data) {
        add(NewUserLocationEvent(LatLng(data.latitude, data.longitude)));
      },
    );
  }

  FutureOr<void> _onNewUserLocationEvent(
    NewUserLocationEvent event,
    Emitter<LocationState> emit,
  ) {
    emit(
      state.copyWith(
        lastKownLocation: event.newLocation,
        myLocationHistory: [...state.myLocationHistory, event.newLocation],
      ),
    );
  }
}
