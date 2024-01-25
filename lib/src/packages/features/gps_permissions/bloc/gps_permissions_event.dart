part of 'gps_permissions_bloc.dart';

sealed class GpsPermissionsEvent extends Equatable {
  const GpsPermissionsEvent();

  @override
  List<Object> get props => [];
}

class GpsAndPermissionsEvent extends GpsPermissionsEvent {
  const GpsAndPermissionsEvent(
    this.isGpsEnabled,
    this.isGpsPermissionsGranted,
  );

  final bool isGpsEnabled;
  final bool isGpsPermissionsGranted;

  @override
  List<Object> get props => [isGpsEnabled, isGpsPermissionsGranted];
}

class GpsInitialStatusEvent extends GpsPermissionsEvent {
  const GpsInitialStatusEvent();
}

class ChangeGpsStatusEvent extends GpsPermissionsEvent {
  const ChangeGpsStatusEvent();
}

class AskGpsAccessEvent extends GpsPermissionsEvent {
  const AskGpsAccessEvent();
}

class OpenAppSettinsEvent extends GpsPermissionsEvent {
  const OpenAppSettinsEvent();
}
