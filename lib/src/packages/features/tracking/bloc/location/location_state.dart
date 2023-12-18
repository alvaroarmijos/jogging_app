part of 'location_bloc.dart';

final class LocationState extends Equatable {
  const LocationState({
    this.lastKownLocation,
    this.speed = 0.0,
    myLocationHistory,
  }) : myLocationHistory = myLocationHistory ?? const [];

  final LatLng? lastKownLocation;
  final List<LatLng> myLocationHistory;
  final double speed;

  LocationState copyWith({
    LatLng? lastKownLocation,
    List<LatLng>? myLocationHistory,
    bool? isFollowingUser,
    double? speed,
  }) =>
      LocationState(
        lastKownLocation: lastKownLocation ?? this.lastKownLocation,
        myLocationHistory: myLocationHistory ?? this.myLocationHistory,
        speed: speed ?? this.speed,
      );

  @override
  List<Object?> get props => [lastKownLocation, myLocationHistory, speed];
}
