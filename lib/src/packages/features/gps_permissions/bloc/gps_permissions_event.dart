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
