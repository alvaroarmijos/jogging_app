part of 'gps_permissions_bloc.dart';

sealed class GpsPermissionsEvent extends Equatable {
  const GpsPermissionsEvent();
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

  @override
  List<Object?> get props => [];
}

class ChangeGpsStatusEvent extends GpsPermissionsEvent {
  const ChangeGpsStatusEvent();

  @override
  List<Object?> get props => [];
}
