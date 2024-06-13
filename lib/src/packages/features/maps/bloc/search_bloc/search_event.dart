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

class GetRouteEvent extends SearchEvent {
  const GetRouteEvent(this.start, this.end);

  final LatLng start;
  final LatLng end;
}
