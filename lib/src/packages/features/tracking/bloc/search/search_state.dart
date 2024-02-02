part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.showManualMarker = false,
    this.loading = false,
    this.directions,
    this.endPlace,
    this.places = const [],
    this.history = const [],
  });

  final bool showManualMarker;
  final bool loading;
  final Directions? directions;
  final List<Place> places;
  final List<Place> history;
  final Place? endPlace;

  SearchState copyWith({
    bool? showManualMarker,
    bool? loading,
    Directions? directions,
    List<Place>? places,
    List<Place>? history,
    Place? endPlace,
  }) =>
      SearchState(
        showManualMarker: showManualMarker ?? this.showManualMarker,
        loading: loading ?? this.loading,
        directions: directions ?? this.directions,
        places: places ?? this.places,
        history: history ?? this.history,
        endPlace: endPlace ?? this.endPlace,
      );

  @override
  List<Object?> get props =>
      [showManualMarker, loading, directions, places, history, endPlace];
}
