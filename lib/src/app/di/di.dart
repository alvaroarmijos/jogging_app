import 'package:get_it/get_it.dart';
import 'package:tracking_app/src/packages/data/device/application.dart';
import 'package:tracking_app/src/packages/data/routes/application/get_routes.dart';
import 'package:tracking_app/src/packages/data/routes/domain/directions/directions_service.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/api_client.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/directions/directions_mapper.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/directions/directions_service_impl.dart';
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

  //Routes
  //Use cases
  sl.registerFactory(() => GetRoutes(sl()));
  // Infrastrucre
  sl.registerFactory<DirectionsService>(
      () => DirectionsServiceImpl(sl(), sl()));
  sl.registerFactory(() => const DirectionsMapper());
  sl.registerFactory(() => RoutesApiClient());

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
  // sl.registerFactory(() => MapBloc(sl()));

  // Search
  sl.registerFactory(() => SearchBloc(sl()));
}
