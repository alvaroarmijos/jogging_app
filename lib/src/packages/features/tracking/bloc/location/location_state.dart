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
  final double speed;
  final double distance;

  double get speedInKm => speed * 3.6;

  //This is an estimate, assuming a 70kg person burns 67.9 kcal per kilometre.
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
