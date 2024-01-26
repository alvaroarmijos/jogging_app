import 'package:get_it/get_it.dart';
import 'package:tracking_app/src/packages/data/device/application.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/gps_permissions.dart';

import '../../packages/features/tracking/tracking.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use casos
  sl.registerFactory(() => const AskGpsAccess());
  sl.registerFactory(() => const CheckPermissionsGranted());
  sl.registerFactory(() => const GpsInitialStatus());
  sl.registerFactory(() => const GpsStatus());
  sl.registerFactory(() => const OpenAppSettins());
  sl.registerFactory(() => const GetInitialPosition());
  sl.registerFactory(() => const GpsPositionStream());

  // Features
  // Gps Permions
  //Bloc
  sl.registerFactory(
    () => GpsPermissionsBloc(
      sl(),
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );

  //Tracking
  sl.registerFactory(() => LocationBloc(
        sl(),
        sl(),
      ));

  // Map
  sl.registerFactory(() => MapBloc(sl()));
}
