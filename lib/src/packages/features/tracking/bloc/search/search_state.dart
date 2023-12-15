part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.showManulMarker = false,
    this.loading = false,
    this.traffic,
  });

  final bool showManulMarker;
  final bool loading;
  final Traffic? traffic;

  SearchState copyWith({
    bool? showManulMarker,
    bool? loading,
    Traffic? traffic,
  }) =>
      SearchState(
        showManulMarker: showManulMarker ?? this.showManulMarker,
        loading: loading ?? this.loading,
        traffic: traffic ?? this.traffic,
      );

  @override
  List<Object?> get props => [showManulMarker, traffic, loading];
}
