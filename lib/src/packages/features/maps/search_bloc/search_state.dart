part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({
    this.showManualMarker = false,
  });

  final bool showManualMarker;

  SearchState copyWith({
    bool? showManualMarker,
  }) =>
      SearchState(
        showManualMarker: showManualMarker ?? this.showManualMarker,
      );

  @override
  List<Object> get props => [showManualMarker];
}
