part of 'location_bloc.dart';

final class LocationState extends Equatable {
  const LocationState({
    this.lastKownLocation,
    this.speed = 0.0,
    this.distance = 0.0,
    this.weight = 70,
    myLocationHistory,
  }) : myLocationHistory = myLocationHistory ?? const [];

  final LatLng? lastKownLocation;
  final List<LatLng> myLocationHistory;
  final double speed;
  final double distance;
  final double weight;

  double get speedInKm => speed * 3.6;

  //This is an estimate,
  double get kcal => 1.03 * distance * weight;

  LocationState copyWith({
    LatLng? lastKownLocation,
    List<LatLng>? myLocationHistory,
    bool? isFollowingUser,
    double? speed,
    double? distance,
    double? weight,
  }) =>
      LocationState(
        lastKownLocation: lastKownLocation ?? this.lastKownLocation,
        myLocationHistory: myLocationHistory ?? this.myLocationHistory,
        speed: speed ?? this.speed,
        distance: distance ?? this.distance,
        weight: weight ?? this.weight,
      );

  @override
  List<Object?> get props =>
      [lastKownLocation, myLocationHistory, speed, distance, weight];
}
