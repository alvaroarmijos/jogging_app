part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class ShowManualMarkerEvent extends SearchEvent {
  const ShowManualMarkerEvent(this.showManualMarker);

  final bool showManualMarker;
}
