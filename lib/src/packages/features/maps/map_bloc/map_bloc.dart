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
    on<UpdateUserPolylineEvent>(_onUpdateUserPolylineEvent);
    on<FollowingUserEvent>(_onFollowingUserEvent);
    on<ChangeShowUserRouteEvent>(_onChangeShowUserRouteEvent);
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

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.moveCamera(cameraUpdate);
  }

  FutureOr<void> _onUpdateUserPolylineEvent(
    UpdateUserPolylineEvent event,
    Emitter<MapState> emit,
  ) {
    final myRoute = Polyline(
      polylineId: const PolylineId('myRoute'),
      color: AppColors.primary,
      points: event.userLocations,
      endCap: Cap.buttCap,
      startCap: Cap.buttCap,
      width: 5,
      patterns: [
        PatternItem.dot,
        PatternItem.gap(AppDimens.dimen_8),
      ],
    );

    final currentPolylines = Map<String, Polyline>.from(state.polylines);

    currentPolylines['myRoute'] = myRoute;

    emit(state.copyWith(polylines: currentPolylines));
  }

  FutureOr<void> _onFollowingUserEvent(
    FollowingUserEvent event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(isFollowingUser: event.isFollowingUser));
  }

  FutureOr<void> _onChangeShowUserRouteEvent(
    ChangeShowUserRouteEvent event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(showMyRoute: !state.showMyRoute));
  }
}
