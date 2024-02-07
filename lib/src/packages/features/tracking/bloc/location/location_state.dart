part of 'location_bloc.dart';

final class LocationState extends Equatable {
  const LocationState({
    this.lastKownLocation,
    this.speed = 0.0,
    this.distance = 0.0,
    myLocationHistory,
  }) : myLocationHistory = myLocationHistory ?? const [];

  final LatLng? lastKownLocation;
  final List<LatLng> myLocationHistory;
  //speed in m/s
  final double speed;
  final double distance;

  double get speedInKiometers => speed * 3.6;

  double get kcal => distance * 67.9;

  LocationState copyWith({
    LatLng? lastKownLocation,
    List<LatLng>? myLocationHistory,
    bool? isFollowingUser,
    double? speed,
    double? distance,
  }) =>
      LocationState(
        lastKownLocation: lastKownLocation ?? this.lastKownLocation,
        myLocationHistory: myLocationHistory ?? this.myLocationHistory,
        speed: speed ?? this.speed,
        distance: distance ?? this.distance,
      );

  @override
  List<Object?> get props =>
      [lastKownLocation, myLocationHistory, speed, distance];
}
