import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:rxdart/rxdart.dart';
import 'package:tracking_app/src/packages/data/account/account.dart';
import 'package:tracking_app/src/packages/data/device/application.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(
    this._getCurrentPosition,
    this._getPositionStream,
    this._getCurrentUser,
  ) : super(const LocationState()) {
    on<GetCurrentPositionEvent>(_onGetCurrentPositionEvent);
    on<StartTrackingUserEvent>(_onStartTrackingUserEvent);
    on<NewUserLocationEvent>(_onNewUserLocationEvent);
  }

  final GetCurrentPosition _getCurrentPosition;
  final GetPositionStream _getPositionStream;
  final GetCurrentUser _getCurrentUser;

  FutureOr<void> _onGetCurrentPositionEvent(
    GetCurrentPositionEvent event,
    Emitter<LocationState> emit,
  ) {
    return emit.forEach(_getCurrentPosition(), onData: (data) {
      return const LocationState();
    });
  }

  FutureOr<void> _onStartTrackingUserEvent(
    StartTrackingUserEvent event,
    Emitter<LocationState> emit,
  ) {
    return emit.onEach(
      Rx.combineLatest2(
        _getPositionStream(),
        _getCurrentUser(),
        (position, user) => (position, user),
      ),
      onData: (data) {
        if (data.$2 != null) {
          add(
            NewUserLocationEvent(LatLng(data.$1.latitude, data.$1.longitude),
                data.$1.speed, data.$2!.weight),
          );
        }
      },
    );
  }

  FutureOr<void> _onNewUserLocationEvent(
    NewUserLocationEvent event,
    Emitter<LocationState> emit,
  ) {
    final myLocationHistory = [...state.myLocationHistory, event.newLocation];

    double currentDistance = 0;
    if (state.myLocationHistory.length > 1) {
      currentDistance = Geolocator.distanceBetween(
            myLocationHistory[myLocationHistory.length - 2].latitude,
            myLocationHistory[myLocationHistory.length - 2].longitude,
            myLocationHistory.last.latitude,
            myLocationHistory.last.longitude,
          ) /
          1000;
    }
    emit(
      state.copyWith(
        lastKownLocation: event.newLocation,
        myLocationHistory: myLocationHistory,
        speed: event.speed,
        distance: state.distance + currentDistance,
        weight: event.weight,
      ),
    );
  }
}
