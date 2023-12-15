part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

final class MapInitializedEvent extends MapEvent {
  final GoogleMapController controller;

  const MapInitializedEvent(this.controller);
}

final class FollowingUserEvent extends MapEvent {
  const FollowingUserEvent(this.isFollowigUser);

  final bool isFollowigUser;
}

final class UpdateUserPolylineEvent extends MapEvent {
  const UpdateUserPolylineEvent(this.userLocations);

  final List<LatLng> userLocations;
}

final class ChangeShowUserRouteEvent extends MapEvent {
  const ChangeShowUserRouteEvent();
}

class AddPolylineEvent extends MapEvent {
  const AddPolylineEvent(this.polylines);

  final Map<String, Polyline> polylines;
}
