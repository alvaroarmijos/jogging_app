import 'package:get_it/get_it.dart';
import 'package:tracking_app/src/packages/data/device/application/application.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/bloc/gps_permission_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/location_bloc/location_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/map_bloc/map_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/search_bloc/search_bloc.dart';

final sl = GetIt.instance;

void setup() {
  // Features
  sl.registerFactory(() => GpsPermissionBloc(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ));

  sl.registerFactory(() => LocationBloc(
        sl(),
        sl(),
      ));

  sl.registerFactory(() => MapBloc());

  sl.registerFactory(() => SearchBloc());

  // Use cases
  sl.registerFactory(() => const GpsInitialStatus());
  sl.registerFactory(() => const GpsStatus());
  sl.registerFactory(() => const AskGpsPermissions());
  sl.registerFactory(() => const OpenAppSettings());
  sl.registerFactory(() => const CheckPermissions());
  sl.registerFactory(() => const GetInitialPosition());
  sl.registerFactory(() => const GpsPositionStream());
}
