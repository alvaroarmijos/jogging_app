import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gps_permission_event.dart';
part 'gps_permission_state.dart';

class GpsPermissionbloc extends Bloc<GpsPermissionEvent, GpsPermissionState> {
  GpsPermissionbloc() : super(const GpsPermissionState()) {
    on<GpsAndPermissionEvent>(_onGpsAndPermissionEvent);
  }

  FutureOr<void> _onGpsAndPermissionEvent(
    GpsAndPermissionEvent event,
    Emitter<GpsPermissionState> emit,
  ) {
    emit(state.copyWith(
      isGpsEnable: event.isGpsEnabled,
      isGpsPermissionGranted: event.isGpsPermissionsGranted,
    ));
  }
}
