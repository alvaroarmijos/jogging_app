part of 'search_bloc.dart';

final class SearchState extends Equatable {
  const SearchState({this.showManulMarker = false});

  final bool showManulMarker;

  SearchState copyWith({
    bool? showManulMarker,
  }) =>
      SearchState(
        showManulMarker: showManulMarker ?? this.showManulMarker,
      );

  @override
  List<Object> get props => [showManulMarker];
}
