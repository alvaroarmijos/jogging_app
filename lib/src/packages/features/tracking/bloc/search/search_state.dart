part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.showManulMarker = false,
    this.loading = false,
    this.traffic,
    this.endPlace,
    this.places = const [],
    this.history = const [],
  });

  final bool showManulMarker;
  final bool loading;
  final Traffic? traffic;
  final List<Place> places;
  final List<Place> history;
  final Place? endPlace;

  SearchState copyWith({
    bool? showManulMarker,
    bool? loading,
    Traffic? traffic,
    List<Place>? places,
    List<Place>? history,
    Place? endPlace,
  }) =>
      SearchState(
        showManulMarker: showManulMarker ?? this.showManulMarker,
        loading: loading ?? this.loading,
        traffic: traffic ?? this.traffic,
        places: places ?? this.places,
        history: history ?? this.history,
        endPlace: endPlace ?? this.endPlace,
      );

  @override
  List<Object?> get props => [
        showManulMarker,
        traffic,
        loading,
        places,
        history,
        endPlace,
      ];
}
