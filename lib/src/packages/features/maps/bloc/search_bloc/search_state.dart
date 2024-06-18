part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.showManualMarker = false,
    this.isLoading = false,
    this.directions,
    this.places,
    this.history = const [],
    this.endPlace,
  });

  final bool showManualMarker;
  final bool isLoading;
  final Directions? directions;
  final List<Place>? places;
  final List<Place> history;
  final Place? endPlace;

  SearchState copyWith({
    bool? showManualMarker,
    bool? isLoading,
    Directions? directions,
    List<Place>? places,
    List<Place>? history,
    Place? endPlace,
  }) =>
      SearchState(
        showManualMarker: showManualMarker ?? this.showManualMarker,
        directions: directions ?? this.directions,
        isLoading: isLoading ?? this.isLoading,
        places: places ?? this.places,
        history: history ?? this.history,
        endPlace: endPlace ?? this.endPlace,
      );

  @override
  List<Object?> get props =>
      [showManualMarker, directions, isLoading, places, history, endPlace];
}
