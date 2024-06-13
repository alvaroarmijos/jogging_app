part of 'location_bloc.dart';

final class LocationState extends Equatable {
  const LocationState({
    this.lastKnownLocation,
    myLocationHistory,
  }) : myLocationHistory = myLocationHistory ?? const [];

  final LatLng? lastKnownLocation;
  final List<LatLng> myLocationHistory;

  LocationState copyWith({
    LatLng? lastKnownLocation,
    List<LatLng>? myLocationHistory,
  }) =>
      LocationState(
        lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
        myLocationHistory: myLocationHistory ?? this.myLocationHistory,
      );

  @override
  List<Object?> get props => [lastKnownLocation, myLocationHistory];
}
