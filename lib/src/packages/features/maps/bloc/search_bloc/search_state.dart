part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.showManualMarker = false,
    this.isLoading = false,
    this.directions,
    this.places,
  });

  final bool showManualMarker;
  final bool isLoading;
  final Directions? directions;
  final List<Place>? places;

  SearchState copyWith({
    bool? showManualMarker,
    bool? isLoading,
    Directions? directions,
    List<Place>? places,
  }) =>
      SearchState(
        showManualMarker: showManualMarker ?? this.showManualMarker,
        directions: directions ?? this.directions,
        isLoading: isLoading ?? this.isLoading,
        places: places ?? this.places,
      );

  @override
  List<Object?> get props => [
        showManualMarker,
        directions,
        isLoading,
        places,
      ];
}
