part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.showManulMarker = false,
    this.loading = false,
    this.directions,
    this.endPlace,
    this.places = const [],
    this.history = const [],
  });

  final bool showManulMarker;
  final bool loading;
  final Directions? directions;
  final List<Place> places;
  final List<Place> history;
  final Place? endPlace;

  SearchState copyWith({
    bool? showManulMarker,
    bool? loading,
    Directions? directions,
    List<Place>? places,
    List<Place>? history,
    Place? endPlace,
  }) =>
      SearchState(
        showManulMarker: showManulMarker ?? this.showManulMarker,
        loading: loading ?? this.loading,
        directions: directions ?? this.directions,
        places: places ?? this.places,
        history: history ?? this.history,
        endPlace: endPlace ?? this.endPlace,
      );

  @override
  List<Object?> get props =>
      [showManulMarker, directions, loading, places, history, endPlace];
}
