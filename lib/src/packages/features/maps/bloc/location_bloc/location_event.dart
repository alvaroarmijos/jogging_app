part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class InitialLocationEvent extends LocationEvent {
  const InitialLocationEvent();
}

class StartTrackingUserEvent extends LocationEvent {
  const StartTrackingUserEvent();
}

class NewUserLocationEvent extends LocationEvent {
  const NewUserLocationEvent(this.newLocation);

  final LatLng newLocation;
}
