part of 'gps_permissions_bloc.dart';

sealed class GpsPermissionsEvent extends Equatable {
  const GpsPermissionsEvent();

  @override
  List<Object?> get props => [];
}

class GpsAndPermissionEvent extends GpsPermissionsEvent {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  const GpsAndPermissionEvent({
    required this.isGpsEnabled,
    required this.isGpsPermissionGranted,
  });

  @override
  List<Object?> get props => [isGpsEnabled, isGpsPermissionGranted];
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

class OpenAppSettingsEvent extends GpsPermissionsEvent {
  const OpenAppSettingsEvent();
}
