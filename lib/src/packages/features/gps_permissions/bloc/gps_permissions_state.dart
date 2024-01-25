part of 'gps_permissions_bloc.dart';

class GpsPermissionsState extends Equatable {
  const GpsPermissionsState({
    this.isGpsEnabled = false,
    this.isGpsPermissionGranted = false,
  });

  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  bool get isAllGranted => isGpsEnabled && isGpsPermissionGranted;

  GpsPermissionsState copyWith({
    bool? isGpsEnabled, //true
    bool? isGpsPermissionGranted, //true
  }) =>
      GpsPermissionsState(
        isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
        isGpsPermissionGranted:
            isGpsPermissionGranted ?? this.isGpsPermissionGranted,
      );

  @override
  List<Object> get props => [isGpsEnabled, isGpsPermissionGranted];
}
