part of 'map_bloc.dart';

final class MapState extends Equatable {
  const MapState({
    this.isMapInitialized = false,
    this.isFollowingUser = true,
    this.showMyRoute = true,
    polylines,
  }) : polylines = polylines ?? const {};

  final bool isMapInitialized;
  final bool isFollowingUser;
  final bool showMyRoute;
  final Map<String, Polyline> polylines;

  MapState copyWith({
    bool? isMapInitialized,
    bool? isFollowingUser,
    bool? showMyRoute,
    Map<String, Polyline>? polylines,
  }) =>
      MapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        polylines: polylines ?? this.polylines,
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        showMyRoute: showMyRoute ?? this.showMyRoute,
      );

  @override
  List<Object> get props => [
        isMapInitialized,
        polylines,
        isFollowingUser,
        showMyRoute,
      ];
}
