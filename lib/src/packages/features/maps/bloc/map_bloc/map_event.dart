part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class MapInitializeEvent extends MapEvent {
  const MapInitializeEvent(this.controller);

  final GoogleMapController controller;
}

class UpdateUserPolylineEvent extends MapEvent {
  const UpdateUserPolylineEvent(this.userLocations);

  final List<LatLng> userLocations;
}

class FollowingUserEvent extends MapEvent {
  const FollowingUserEvent(this.isFollowingUser);

  final bool isFollowingUser;
}

class ChangeShowUserRouteEvent extends MapEvent {
  const ChangeShowUserRouteEvent();
}

class AddPolylineDirectionEvent extends MapEvent {
  const AddPolylineDirectionEvent(this.directions);

  final Directions directions;
}
