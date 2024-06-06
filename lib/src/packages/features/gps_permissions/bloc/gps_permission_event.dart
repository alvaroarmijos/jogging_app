part of 'gps_permission_bloc.dart';

sealed class GpsPermissionEvent extends Equatable {
  const GpsPermissionEvent();

  @override
  List<Object?> get props => [];
}

class GpsAndPermissionEvent extends GpsPermissionEvent {
  const GpsAndPermissionEvent(
    this.isGpsEnabled,
    this.isGpsPermissionsGranted,
  );

  final bool isGpsEnabled;
  final bool isGpsPermissionsGranted;
}

class GpsInitialStatusEvent extends GpsPermissionEvent {
  const GpsInitialStatusEvent();
}

class ChangeGpsStatusEvent extends GpsPermissionEvent {
  const ChangeGpsStatusEvent();
}

class AskGpsAccessEvent extends GpsPermissionEvent {
  const AskGpsAccessEvent();
}

class OpenAppSettingsEvent extends GpsPermissionEvent {
  const OpenAppSettingsEvent();
}
