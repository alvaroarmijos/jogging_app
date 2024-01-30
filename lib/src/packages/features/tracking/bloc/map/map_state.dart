part of 'map_bloc.dart';

final class MapState extends Equatable {
  const MapState({
    this.isMapInitilazed = false,
    this.isFollowingUser = true,
    this.showMyRoute = true,
    polylines,
  }) : polylines = polylines ?? const {};

  final bool isMapInitilazed;
  final bool isFollowingUser;
  final bool showMyRoute;
  final Map<String, Polyline> polylines;

  MapState copyWith({
    bool? isMapInitilazed,
    bool? isFollowingUser,
    bool? showMyRoute,
    Map<String, Polyline>? polylines,
  }) {
    return MapState(
      isMapInitilazed: isMapInitilazed ?? this.isMapInitilazed,
      isFollowingUser: isFollowingUser ?? this.isFollowingUser,
      showMyRoute: showMyRoute ?? this.showMyRoute,
      polylines: polylines ?? this.polylines,
    );
  }

  @override
  List<Object> get props =>
      [isMapInitilazed, isFollowingUser, polylines, showMyRoute];
}
