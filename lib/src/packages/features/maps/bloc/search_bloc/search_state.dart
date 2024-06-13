part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.showManualMarker = false,
    this.directions,
  });

  final bool showManualMarker;
  final Directions? directions;

  SearchState copyWith({
    bool? showManualMarker,
    Directions? directions,
  }) =>
      SearchState(
        showManualMarker: showManualMarker ?? this.showManualMarker,
        directions: directions ?? this.directions,
      );

  @override
  List<Object?> get props => [showManualMarker, directions];
}
