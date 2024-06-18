import 'package:get_it/get_it.dart';
import 'package:tracking_app/src/packages/data/device/application/application.dart';
import 'package:tracking_app/src/packages/data/routes/application/application.dart';
import 'package:tracking_app/src/packages/data/routes/domain/directions/directions_service.dart';
import 'package:tracking_app/src/packages/data/routes/domain/places/places_service.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/api_client.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/directions/directions_mapper.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/directions/directions_service_impl.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/places/places_mapper.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/places/places_service_impl.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/bloc/gps_permission_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/location_bloc/location_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/map_bloc/map_bloc.dart';
import 'package:tracking_app/src/packages/features/maps/bloc/search_bloc/search_bloc.dart';

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

  sl.registerFactory(() => SearchBloc(sl(), sl(), sl()));

  // Use cases
  sl.registerFactory(() => const GpsInitialStatus());
  sl.registerFactory(() => const GpsStatus());
  sl.registerFactory(() => const AskGpsPermissions());
  sl.registerFactory(() => const OpenAppSettings());
  sl.registerFactory(() => const CheckPermissions());
  sl.registerFactory(() => const GetInitialPosition());
  sl.registerFactory(() => const GpsPositionStream());
  sl.registerFactory(() => GetRoutes(sl()));
  sl.registerFactory(() => GetPlace(sl()));
  sl.registerFactory(() => SearchPlaces(sl()));

  // Services
  sl.registerFactory<DirectionsService>(() => DirectionsServiceImpl(
        sl(),
        sl(),
      ));

  sl.registerFactory<PlacesService>(() => PlacesServiceImpl(sl(), sl()));

  // Api Client

  sl.registerFactory(() => RoutesApiClient());
  sl.registerFactory(() => const DirectionsMapper());
  sl.registerFactory(() => const PlacesMapper());
}
