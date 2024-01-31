part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class ShowManualMarkerEvent extends SearchEvent {
  const ShowManualMarkerEvent(this.showManualMarker);

  final bool showManualMarker;
}

final class GetRouteEvent extends SearchEvent {
  const GetRouteEvent(this.start, this.end);

  final LatLng start;
  final LatLng end;

  @override
  List<Object> get props => [start, end];
}
