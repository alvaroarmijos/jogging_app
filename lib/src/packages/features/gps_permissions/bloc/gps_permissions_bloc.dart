import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_app/src/packages/data/device/application.dart';

part 'gps_permissions_event.dart';
part 'gps_permissions_state.dart';

class GpsPermissionsBloc
    extends Bloc<GpsPermissionsEvent, GpsPermissionsState> {
  GpsPermissionsBloc(
    this._gpsCurrentStatus,
    this._gpsStatus,
  ) : super(const GpsPermissionsState()) {
    on<GpsAndPermissionEvent>(_onGpsAndPermissionEvent);
    on<GpsInitialStatusEvent>(_onGpsInitialStatusEvent);
    on<ChangeGpsStatusEvent>(_onChangeGpsStatusEvent);

    _init();
  }

  final GpsCurrentStatus _gpsCurrentStatus;
  final GpsStatus _gpsStatus;

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

  FutureOr<void> _onGpsInitialStatusEvent(
    GpsInitialStatusEvent event,
    Emitter<GpsPermissionsState> emit,
  ) {
    return emit.forEach(
      _gpsCurrentStatus().asStream(),
      onData: (data) => state.copyWith(isGpsEnabled: data),
    );
  }

  FutureOr<void> _onChangeGpsStatusEvent(
    ChangeGpsStatusEvent event,
    Emitter<GpsPermissionsState> emit,
  ) {
    return emit.forEach(
      _gpsStatus(),
      onData: (data) => state.copyWith(isGpsEnabled: data),
    );
  }

  void _init() {
    add(const GpsInitialStatusEvent());
    add(const ChangeGpsStatusEvent());
  }
}
