import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/routes.dart';

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
    on<AddToHistoryEvent>(_onAddToHistoryEvent);
  }

  final GetRoutes _getRoutes;
  final SearchPlaces _searchPlaces;

  FutureOr<void> _onShowManualMarkerEvent(
    ShowManualMarkerEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(
      state.copyWith(
        showManualMarker: event.showManualMarker,
      ),
    );
  }

  FutureOr<void> _onGetRouteEvent(
    GetRouteEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(state.copyWith(loading: true));
    return emit.forEach(
      _getRoutes(event.start, event.end),
      onData: (directions) => state.copyWith(
        directions: directions,
        loading: false,
      ),
    );
  }

  FutureOr<void> _onGetPlacesEvent(
    GetPlacesEvent event,
    Emitter<SearchState> emit,
  ) {
    return emit.forEach(
      _searchPlaces(event.proximity, event.query),
      onData: (places) => state.copyWith(
        places: places,
      ),
    );
  }

  FutureOr<void> _onAddToHistoryEvent(
    AddToHistoryEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(state.copyWith(
      history: [event.place, ...state.history],
    ));
  }
}
