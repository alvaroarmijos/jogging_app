import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/core/ui/ui.dart';
import 'package:tracking_app/src/packages/data/routes/routes.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

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
      if (locationState.lastKownLocation != null) {
        add(UpdateUserPolylineEvent(locationState.myLocationHistory));
      }
      if (!state.isFollowingUser) return;
      if (locationState.lastKownLocation == null) return;
      moveCamera(locationState.lastKownLocation!);
    });

    searchStateSubscription = searchBloc.stream.listen((searchState) {
      if (searchState.traffic != null) {
        drawRoutePolyline(searchState.traffic!, endPlace: searchState.endPlace);
      }
    });
  }

  GoogleMapController? _mapController;
  StreamSubscription<LocationState>? locationStateSubscription;
  StreamSubscription<SearchState>? searchStateSubscription;
  LatLng? mapCenter;

  final LocationBloc locationBloc;
  final SearchBloc searchBloc;

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

  FutureOr<void> _onAddPolylineEvent(
    AddPolylineEvent event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(polylines: event.polylines, markers: event.markers));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  void centerCameraPoints(List<LatLng> points) {
    _mapController?.animateCamera(
        CameraUpdate.newLatLngBounds(getLatLngBounds(points), 50));
  }

  void drawRoutePolyline(Traffic traffic, {Place? endPlace}) async {
    final myRoute = Polyline(
      polylineId: const PolylineId('route'),
      color: Colors.black,
      width: 5,
      points: traffic.points,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
    );

    double kms = traffic.distance / 1000;
    kms = (kms * 100).floorToDouble();
    kms /= 100;

    int walkingDuration = (traffic.duration / 60).floorToDouble().toInt();

    //custom Marker from asset and network
    // final startImageMarker = await getAssetImageMarker();
    // final endImageMarker = await getNetworkImageMarker();

    //Cabify markers
    final startImageMarker = await getCustomMarker(
        "$walkingDuration min / ${kms.toInt()} km",
        start: true);
    final endImageMarker =
        await getCustomMarker(endPlace?.text ?? "", start: false);

    //Uber markers
    // final startImageMarker =
    //     await getStartCustomMarker(walkingDuration, endPlace?.text ?? "");
    // final endImageMarker =
    //     await getEndCustomMarker(kms.toInt(), endPlace?.placeName ?? "");

    final startMarker = Marker(
      markerId: const MarkerId('start'),
      position: traffic.points.first,
      icon: startImageMarker,
      //cabify offset
      anchor: const Offset(0.92, 0.9),
      //uber offset
      // anchor: const Offset(0.1, 0.9),
      // infoWindow: InfoWindow(
      //   title: 'Inicio',
      //   snippet: 'kms: $kms, duration: $walkingDuration',
      // ),
    );

    final endmarker = Marker(
      markerId: const MarkerId('end'),
      position: traffic.points.last,
      icon: endImageMarker,
      // infoWindow: InfoWindow(
      //   title: endPlace?.text ?? 'Fin',
      //   snippet: endPlace?.placeName ?? 'Este es el punto de final de mi ruta',
      // ),
    );

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['route'] = myRoute;

    final currentMarkers = Map<String, Marker>.from(state.markers);
    currentMarkers['start'] = startMarker;
    currentMarkers['end'] = endmarker;

    // Future.delayed(const Duration(milliseconds: 300)).then(
    //   (value) => _mapController?.showMarkerInfoWindow(const MarkerId('start')),
    // );

    centerCameraPoints(traffic.points);

    add(AddPolylineEvent(currentPolylines, currentMarkers));
  }

  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    searchStateSubscription?.cancel();
    return super.close();
  }
}
