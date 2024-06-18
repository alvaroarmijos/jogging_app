import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tracking_app/src/packages/data/routes/application/application.dart';
import 'package:tracking_app/src/packages/data/routes/domain/directions/directions.dart';
import 'package:tracking_app/src/packages/data/routes/domain/places/places.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(
    this._getRoutes,
    this._searchPlaces,
    this._getPlace,
  ) : super(const SearchState()) {
    on<ShowManualMarkerEvent>(_onShowManualMarkerEvent);
    on<GetRouteEvent>(_onGetRouteEvent);
    on<GetPlacesEvent>(_onGetPlacesEvent);
    on<AddToHistoryEvent>(_onAddToHistoryEvent);
  }

  final GetRoutes _getRoutes;
  final SearchPlaces _searchPlaces;
  final GetPlace _getPlace;

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
      Rx.combineLatest2(
          _getRoutes(
            event.start,
            event.end,
          ),
          _getPlace(
            event.end,
          ),
          (directions, endPlace) => (directions, endPlace)),
      onData: (data) {
        return state.copyWith(
          directions: data.$1,
          showManualMarker: false,
          isLoading: false,
          endPlace: data.$2,
        );
      },
    );
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

  FutureOr<void> _onAddToHistoryEvent(
    AddToHistoryEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(state.copyWith(history: [event.place, ...state.history]));
  }
}
