part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class ShowManualMarkerEvent extends SearchEvent {
  const ShowManualMarkerEvent(this.showManualMarker);

  final bool showManualMarker;

  @override
  List<Object> get props => [showManualMarker];
}

final class GetRouteEvent extends SearchEvent {
  const GetRouteEvent(this.start, this.end);

  final LatLng start;
  final LatLng end;

  @override
  List<Object> get props => [start, end];
}

final class GetPlacesEvent extends SearchEvent {
  const GetPlacesEvent(this.proximity, this.query);

  final LatLng proximity;
  final String query;

  @override
  List<Object> get props => [proximity, query];
}

final class AddToHistoryEvent extends SearchEvent {
  const AddToHistoryEvent(this.place);

  final Place place;
}
