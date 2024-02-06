part of 'location_bloc.dart';

final class LocationState extends Equatable {
  const LocationState({
    this.lastKnownLocation,
    this.speed = 0.0,
    myLocationHistory,
  }) : myLocationHistory = myLocationHistory ?? const [];

  final LatLng? lastKnownLocation;
  final List<LatLng> myLocationHistory;
  final double speed;

  LocationState copyWith({
    LatLng? lastKnownLocation,
    List<LatLng>? myLocationHistory,
    double? speed,
  }) =>
      LocationState(
        lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
        myLocationHistory: myLocationHistory ?? this.myLocationHistory,
        speed: speed ?? this.speed,
      );

  @override
  List<Object?> get props => [lastKnownLocation, myLocationHistory, speed];
}
