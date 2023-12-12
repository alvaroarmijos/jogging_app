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
    on<FollowingUserEvent>(_onFollowingUserEvent);
    on<UpdateUserPolylineEvent>(_onUpdateUserPolylineEvent);
    on<ChangeShowUserRouteEvent>(_onChangeShowUserRouteEvent);

    locationStateSubscription = locationBloc.stream.listen((locationState) {
      if (locationState.lastKownLocation != null) {
        add(UpdateUserPolylineEvent(locationState.myLocationHistory));
      }
      if (!state.isFollowingUser) return;
      if (locationState.lastKownLocation == null) return;
      moveCamera(locationState.lastKownLocation!);
    });
  }

  GoogleMapController? _mapController;
  StreamSubscription<LocationState>? locationStateSubscription;

  final LocationBloc locationBloc;

  FutureOr<void> _onMapInitializedEvent(
    MapInitializedEvent event,
    Emitter<MapState> emit,
  ) {
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(mapStyle));
    emit(state.copyWith(isMapInitialized: true));
  }

  FutureOr<void> _onFollowingUserEvent(
    FollowingUserEvent event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(isFollowingUser: event.isFollowigUser));
  }

  FutureOr<void> _onUpdateUserPolylineEvent(
    UpdateUserPolylineEvent event,
    Emitter<MapState> emit,
  ) {
    final myRoute = Polyline(
      polylineId: const PolylineId("myRoute"),
      color: TrackingColors.primary,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      points: event.userLocations,
    );

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines["myRoute"] = myRoute;

    emit(state.copyWith(polylines: currentPolylines));
  }

  FutureOr<void> _onChangeShowUserRouteEvent(
    ChangeShowUserRouteEvent event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(showMyRoute: !state.showMyRoute));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    return super.close();
  }
}
