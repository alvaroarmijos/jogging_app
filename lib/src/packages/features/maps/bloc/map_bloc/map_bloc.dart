import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/core/ui/widgets/custom_images.markers.dart';
import 'package:tracking_app/src/packages/data/routes/domain/directions/directions.dart';
import 'package:tracking_app/src/packages/data/routes/domain/places/places.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState()) {
    on<MapInitializeEvent>(_onMapInitializeEvent);
    on<UpdateUserPolylineEvent>(_onUpdateUserPolylineEvent);
    on<FollowingUserEvent>(_onFollowingUserEvent);
    on<ChangeShowUserRouteEvent>(_onChangeShowUserRouteEvent);
    on<AddPolylineDirectionEvent>(_onAddPolylineDirectionEvent);
  }

  GoogleMapController? _mapController;
  LatLng? mapCenter;

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

  FutureOr<void> _onAddPolylineDirectionEvent(
    AddPolylineDirectionEvent event,
    Emitter<MapState> emit,
  ) async {
    final route = Polyline(
      polylineId: const PolylineId('route'),
      color: Colors.black,
      points: event.directions.points,
      endCap: Cap.buttCap,
      startCap: Cap.buttCap,
      width: 5,
    );

    double distanceKm = event.directions.distance / 1000;

    distanceKm = (distanceKm * 100).floorToDouble();

    distanceKm /= 100;

    final duration = (event.directions.duration / 60).floorToDouble().toInt();

    // Markers - Google maps
    // final startMarker = Marker(
    //   markerId: const MarkerId('start'),
    //   position: event.directions.points[0],
    //   infoWindow: InfoWindow(
    //     title: 'Punto de inicio',
    //     snippet: 'kms: $distanceKm, duration: $duration min.',
    //   ),
    // );

    final assetIcon = await getAssetImageMarker();
    final newtworkIcon = await getNetworkImageMarker();

    // final startAssetMarker = Marker(
    //   markerId: const MarkerId('start'),
    //   position: event.directions.points[0],
    //   icon: assetIcon,
    //   infoWindow: InfoWindow(
    //     title: 'Punto de inicio',
    //     snippet: 'kms: $distanceKm, duration: $duration min.',
    //   ),
    // );

    final startNetworkMarker = Marker(
      markerId: const MarkerId('start'),
      position: event.directions.points[0],
      icon: newtworkIcon,
      infoWindow: InfoWindow(
        title: 'Punto de inicio',
        snippet: 'kms: $distanceKm, duration: $duration min.',
      ),
    );

    // Markers google maps

    // final endMarker = Marker(
    //   markerId: const MarkerId('end'),
    //   position: event.directions.points.last,
    //   infoWindow: InfoWindow(
    //     title: event.endPlace?.text ?? 'Fin',
    //   ),
    // );

    final endAssetMarker = Marker(
      markerId: const MarkerId('end'),
      position: event.directions.points.last,
      icon: assetIcon,
      infoWindow: InfoWindow(
        title: event.endPlace?.text ?? 'Fin',
      ),
    );

    final currentPolylines = Map<String, Polyline>.from(state.polylines);

    currentPolylines['route'] = route;

    final currentMarkers = Map<String, Marker>.from(state.markers);
    currentMarkers['start'] = startNetworkMarker;
    currentMarkers['end'] = endAssetMarker;

    emit(
      state.copyWith(
        polylines: currentPolylines,
        markers: currentMarkers,
      ),
    );
  }
}
