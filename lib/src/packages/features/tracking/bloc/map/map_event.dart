part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

final class MapInitializedEvent extends MapEvent {
  const MapInitializedEvent(this.controller);

  final GoogleMapController controller;
}

final class FollowingUserEvent extends MapEvent {
  const FollowingUserEvent(
    this.isFollowingUser,
  );

  final bool isFollowingUser;
}

final class UpdateUserPolylineEvent extends MapEvent {
  const UpdateUserPolylineEvent(this.userLocations);

  final List<LatLng> userLocations;
}

final class ChangeShowUserRouteEvent extends MapEvent {
  const ChangeShowUserRouteEvent();
}

final class AddPolylineEvent extends MapEvent {
  const AddPolylineEvent(this.polyines);

  final Map<String, Polyline> polyines;
}
