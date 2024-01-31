import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/application/get_routes.dart';
import 'package:tracking_app/src/packages/data/routes/domain/directions/directions.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(
    this._getRoutes,
  ) : super(const SearchState()) {
    on<ShowManualMarkerEvent>(_onShowManualMarkerEvent);
    on<GetRouteEvent>(_onGetRouteEvent);
  }

  final GetRoutes _getRoutes;

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
}
