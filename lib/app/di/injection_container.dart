import 'package:get_it/get_it.dart';
import 'package:tracking_app/src/packages/data/device/application.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/gps_permissions.dart';
import 'package:tracking_app/src/packages/features/tracking/tracking.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Data

  /// Device
  ///
  // Use Cases
  sl.registerFactory(() => const AskGpsAccess());
  sl.registerFactory(() => const CheckPermissionGranted());
  sl.registerFactory(() => const GpsCurrentStatus());
  sl.registerFactory(() => const GpsInitialStatus());
  sl.registerFactory(() => const OpenAppSettings());

  /// Features
  /// GPS Permissions
  // Bloc
  sl.registerFactory(
    () => GpsPermissionsBloc(
      sl(),
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );

  /// Tracking
  // Bloc
  sl.registerFactory(() => LocationBloc());
}
