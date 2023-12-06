import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gps_permissions_event.dart';
part 'gps_permissions_state.dart';

class GpsPermissionsBloc
    extends Bloc<GpsPermissionsEvent, GpsPermissionsState> {
  GpsPermissionsBloc() : super(const GpsPermissionsState()) {
    on<GpsAndPermissionEvent>(_onGpsAndPermissionEvent);
  }

  FutureOr<void> _onGpsAndPermissionEvent(
    GpsAndPermissionEvent event,
    Emitter<GpsPermissionsState> emit,
  ) {
    emit(
      state.copyWith(
        isGpsEnabled: event.isGpsEnabled,
        isGpsPermissionGranted: event.isGpsEnabled,
      ),
    );
  }
}
