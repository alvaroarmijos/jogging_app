import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/data/device/application/application.dart';

part 'gps_permission_event.dart';
part 'gps_permission_state.dart';

class GpsPermissionBloc extends Bloc<GpsPermissionEvent, GpsPermissionState> {
  GpsPermissionBloc(
    this._gpsInitialStatus,
    this._gpsStatus,
  ) : super(const GpsPermissionState()) {
    on<GpsAndPermissionEvent>(_onGpsAndPermissionEvent);
    on<GpsInitialStatusEvent>(_onGpsInitialStatusEvent);
    on<ChangeGpsStatusEvent>(_onChangeGpsStatusEvent);

    _init();
  }

  final GpsInitialStatus _gpsInitialStatus;
  final GpsStatus _gpsStatus;

  FutureOr<void> _onGpsAndPermissionEvent(
    GpsAndPermissionEvent event,
    Emitter<GpsPermissionState> emit,
  ) {
    emit(state.copyWith(
      isGpsEnable: event.isGpsEnabled,
      isGpsPermissionGranted: event.isGpsPermissionsGranted,
    ));
  }

  FutureOr<void> _onGpsInitialStatusEvent(
    GpsInitialStatusEvent event,
    Emitter<GpsPermissionState> emit,
  ) {
    return emit.forEach(_gpsInitialStatus(), onData: (isGpsEnable) {
      return state.copyWith(
        isGpsEnable: isGpsEnable,
      );
    });
  }

  FutureOr<void> _onChangeGpsStatusEvent(
      ChangeGpsStatusEvent event, Emitter<GpsPermissionState> emit) async {
    return emit.forEach(_gpsStatus(), onData: (data) {
      return state.copyWith(
        isGpsEnable: data,
      );
    });
  }

  void _init() {
    add(const GpsInitialStatusEvent());
    add(const ChangeGpsStatusEvent());
  }
}
