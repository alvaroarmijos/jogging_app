part of 'location_bloc.dart';

final class LocationState extends Equatable {
  const LocationState({
    this.lastKownLocation,
    myLocationHistory,
  }) : myLocationHistory = myLocationHistory ?? const [];

  final LatLng? lastKownLocation;
  final List<LatLng> myLocationHistory;

  LocationState copyWith({
    LatLng? lastKownLocation,
    List<LatLng>? myLocationHistory,
  }) =>
      LocationState(
        lastKownLocation: lastKownLocation ?? this.lastKownLocation,
        myLocationHistory: myLocationHistory ?? this.myLocationHistory,
      );

  @override
  List<Object?> get props => [lastKownLocation, myLocationHistory];
}
