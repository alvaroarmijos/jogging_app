part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.showManualMarker = false,
    this.loading = false,
    this.directions,
  });

  final bool showManualMarker;
  final bool loading;
  final Directions? directions;

  SearchState copyWith({
    bool? showManualMarker,
    bool? loading,
    Directions? directions,
  }) =>
      SearchState(
        showManualMarker: showManualMarker ?? this.showManualMarker,
        loading: loading ?? this.loading,
        directions: directions ?? this.directions,
      );

  @override
  List<Object?> get props => [showManualMarker, loading, directions];
}
