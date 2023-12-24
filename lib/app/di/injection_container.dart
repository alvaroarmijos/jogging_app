import 'package:get_it/get_it.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:tracking_app/src/packages/core/utility/utility.dart';
import 'package:tracking_app/src/packages/data/account/src/application/save_user.dart';
import 'package:tracking_app/src/packages/data/account/src/domain/user/auth_repository.dart';
import 'package:tracking_app/src/packages/data/account/src/infrastructure/user/auth_service_impl.dart';
import 'package:tracking_app/src/packages/data/device/application.dart';
import 'package:tracking_app/src/packages/data/routes/routes.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/places/places_service.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/traffic/traffic_service.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/places/places_mapper.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/places/places_service_impl.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/traffic/traffic_mapper.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/traffic/traffic_service_impl.dart';
import 'package:tracking_app/src/packages/features/gps_permissions/gps_permissions.dart';
import 'package:tracking_app/src/packages/features/onboarding/bloc/onboarding_bloc.dart';

import '../../src/packages/features/tracking/tracking.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Core
  ///Utility
  sl.registerFactory(() => InputConverter());

  /// Data

  /// Device
  ///
  // Use Cases
  sl.registerLazySingleton(() => const AskGpsAccess());
  sl.registerLazySingleton(() => const CheckPermissionGranted());
  sl.registerLazySingleton(() => const GpsCurrentStatus());
  sl.registerLazySingleton(() => const GpsInitialStatus());
  sl.registerLazySingleton(() => const OpenAppSettings());
  sl.registerLazySingleton(() => const GetCurrentPosition());
  sl.registerLazySingleton(() => const GetPositionStream());

  /// Account
  ///
  /// UseCases
  sl.registerLazySingleton(() => SaveUser(sl()));

  /// Infrastructure
  sl.registerLazySingleton(() => AuthCache(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  /// Routes
  ///
  // Application
  sl.registerLazySingleton(() => GetRoutes(sl()));
  sl.registerLazySingleton(() => SearchPlaces(sl()));
  sl.registerLazySingleton(() => GetPlace(sl()));
  // Domain
  sl.registerLazySingleton<TrafficService>(
      () => TrafficServiceImpl(sl(), sl()));
  sl.registerLazySingleton<PlacesService>(() => PlacesServiceImpl(sl(), sl()));
  // Infrastructure
  sl.registerLazySingleton(() => const TrafficMapper());
  sl.registerLazySingleton(() => const PlacesMapper());
  sl.registerLazySingleton(() => RoutesApiClient());

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

  /// Onboarding
  /// //Bloc
  sl.registerFactory(() => OnboardingBloc(sl(), sl()));

  /// Tracking
  // Bloc
  sl.registerFactory(() => LocationBloc(sl(), sl()));
  sl.registerFactory(() => SearchBloc(sl(), sl(), sl()));

  //External
  sl.registerLazySingleton(() => RxSharedPreferences.getInstance());
}
