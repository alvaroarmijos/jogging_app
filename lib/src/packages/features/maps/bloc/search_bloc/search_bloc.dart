import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/application/get_routes.dart';
import 'package:tracking_app/src/packages/data/routes/application/search_places.dart';
import 'package:tracking_app/src/packages/data/routes/domain/directions/directions.dart';
import 'package:tracking_app/src/packages/data/routes/domain/places/places.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(
    this._getRoutes,
    this._searchPlaces,
  ) : super(const SearchState()) {
    on<ShowManualMarkerEvent>(_onShowManualMarkerEvent);
    on<GetRouteEvent>(_onGetRouteEvent);
    on<GetPlacesEvent>(_onGetPlacesEvent);
  }

  final GetRoutes _getRoutes;
  final SearchPlaces _searchPlaces;

  FutureOr<void> _onShowManualMarkerEvent(
    ShowManualMarkerEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(state.copyWith(
      showManualMarker: event.showManualMarker,
    ));
  }

  FutureOr<void> _onGetRouteEvent(
    GetRouteEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    return emit.forEach(
        _getRoutes(
          event.start,
          event.end,
        ), onData: (directions) {
      return state.copyWith(
        directions: directions,
        showManualMarker: false,
        isLoading: false,
      );
    });
  }

  FutureOr<void> _onGetPlacesEvent(
    GetPlacesEvent event,
    Emitter<SearchState> emit,
  ) {
    return emit.forEach(
      _searchPlaces(
        event.proximity,
        event.query,
      ),
      onData: (places) {
        return state.copyWith(places: places);
      },
    );
  }
}
