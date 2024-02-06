import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

import '../../../../data/routes/routes.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc(
    this.locationBloc,
    this.searchBloc,
  ) : super(const MapState()) {
    on<MapInitializedEvent>(_onMapInitializedEvent);
    on<FollowingUserEvent>(_onFollowingUserEvent);
    on<UpdateUserPolylineEvent>(_onUpdateUserPolylineEvent);
    on<ChangeShowUserRouteEvent>(_onChangeShowUserRouteEvent);
    on<AddPolylineEvent>(_onAddPolylineEvent);

    locationStateSubscription = locationBloc.stream.listen((locationState) {
      if (locationState.lastKnownLocation != null) {
        add(UpdateUserPolylineEvent(locationState.myLocationHistory));
      }
      if (!state.isFollowingUser) return;
      if (locationState.lastKnownLocation == null) return;
      moveCamera(locationState.lastKnownLocation!);
    });

    searchStateSubscription = searchBloc.stream.listen((searchState) {
      if (searchState.directions != null) {
        // searchBloc.add(const ShowManualMarkerEvent(false));
        drawRoutePolyline(searchState.directions!, searchState.endPlace);
      }
    });
  }

  final LocationBloc locationBloc;
  final SearchBloc searchBloc;

  GoogleMapController? _mapController;
  LatLng? mapCenter;
  StreamSubscription<LocationState>? locationStateSubscription;
  StreamSubscription<SearchState>? searchStateSubscription;

  FutureOr<void> _onMapInitializedEvent(
    MapInitializedEvent event,
    Emitter<MapState> emit,
  ) {
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(mapStyle));
    emit(state.copyWith(isMapInitilazed: true));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  void drawRoutePolyline(Directions directions, Place? endPlace) async {
    final route = Polyline(
      polylineId: const PolylineId('route'),
      color: Colors.black,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      points: directions.points,
    );

    double km = directions.distance / 1000;
    km = (km * 100).floorToDouble();
    km /= 100;

    int walkingDuration = (directions.duration / 60).floorToDouble().toInt();

    /// Start markers
    ///
    // Marker de google maps
    // final startMarker = Marker(
    //   markerId: const MarkerId('start'),
    //   position: directions.points.first,
    //   infoWindow: InfoWindow(
    //     title: 'Inicio',
    //     snippet: 'kms: $km, duration: $walkingDuration',
    //   ),
    // );

    // From image
    // final startImageMarker = await getAssetImageMarker();

    // Uber marker
    final startUberMarker =
        await getStartUberMarker(walkingDuration, endPlace?.placeName ?? "");

    // Cabify Marker
    final startcabifyMarker =
        await getCabifyMarker(endPlace?.placeName ?? "", true);

    // Marker assets
    final startMarker = Marker(
      markerId: const MarkerId('start'),
      position: directions.points.first,
      icon: Platform.isAndroid ? startcabifyMarker : startUberMarker,
      //Uber marker
      // anchor: const Offset(0.05, 0.9),
      //Cabify Marker
      anchor: Platform.isAndroid
          ? const Offset(0.95, 0.9)
          : const Offset(0.05, 0.9),
      infoWindow: InfoWindow(
        title: 'Inicio',
        snippet: 'kms: $km, duration: $walkingDuration',
      ),
    );

    /// End Markers
    ///
    ///
    //End marker de google maps
    // final endMarker = Marker(
    //   markerId: const MarkerId('end'),
    //   position: directions.points.last,
    //   infoWindow: InfoWindow(
    //     title: endPlace?.text ?? 'Fin',
    //     snippet: endPlace?.placeName ?? 'Este es el punto final de la ruta',
    //   ),
    // );

    // Network marker
    // final endIcon = await getnetworkImageMarker();

    // End Uber marker
    final endUberMarker =
        await getEndUberMarker(km.toInt(), endPlace?.text ?? "");

    // End Cabify Marker
    final endCabifyMarker = await getCabifyMarker(endPlace?.text ?? "", false);

    final endMarker = Marker(
      markerId: const MarkerId('end'),
      position: directions.points.last,
      icon: Platform.isAndroid ? endCabifyMarker : endUberMarker,
      infoWindow: InfoWindow(
        title: endPlace?.text ?? 'Fin',
        snippet: endPlace?.placeName ?? 'Este es el punto final de la ruta',
      ),
    );

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['route'] = route;

    final currentMarkers = Map<String, Marker>.from(state.markers);
    currentMarkers['start'] = startMarker;
    currentMarkers['end'] = endMarker;

    add(AddPolylineEvent(currentPolylines, currentMarkers));
  }

  FutureOr<void> _onFollowingUserEvent(
    FollowingUserEvent event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(isFollowingUser: event.isFollowingUser));
  }

  FutureOr<void> _onUpdateUserPolylineEvent(
    UpdateUserPolylineEvent event,
    Emitter<MapState> emit,
  ) {
    final myRoute = Polyline(
        polylineId: const PolylineId('myRoute'),
        color: TrackingColors.primary,
        width: 5,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        points: event.userLocations,
        patterns: [
          PatternItem.dot,
          PatternItem.gap(8),
        ]);

    final currentPolylines = Map<String, Polyline>.from(state.polylines);

    currentPolylines["myRoute"] = myRoute;

    emit(state.copyWith(polylines: currentPolylines));
  }

  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    searchStateSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onChangeShowUserRouteEvent(
    ChangeShowUserRouteEvent event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(showMyRoute: !state.showMyRoute));
  }

  FutureOr<void> _onAddPolylineEvent(
    AddPolylineEvent event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(polylines: event.polyines, markers: event.markers));
  }
}
