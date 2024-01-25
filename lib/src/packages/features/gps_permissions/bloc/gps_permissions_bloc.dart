import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_app/src/packages/data/device/application.dart';

part 'gps_permissions_event.dart';
part 'gps_permissions_state.dart';

class GpsPermissionsBloc
    extends Bloc<GpsPermissionsEvent, GpsPermissionsState> {
  GpsPermissionsBloc(
    this._gpsInitialStatus,
    this._gpsStatus,
  ) : super(const GpsPermissionsState()) {
    on<GpsAndPermissionsEvent>(_onGpsAndPermissionsEvent);
    on<GpsInitialStatusEvent>(_onGpsInitialStatusEvent);
    on<ChangeGpsStatusEvent>(_onChangeGpsStatusEvent);

    _init();
  }

  final GpsInitialStatus _gpsInitialStatus;
  final GpsStatus _gpsStatus;

  FutureOr<void> _onGpsAndPermissionsEvent(
    GpsAndPermissionsEvent event,
    Emitter<GpsPermissionsState> emit,
  ) {
    emit(
      state.copyWith(
        isGpsEnabled: event.isGpsEnabled,
        isGpsPermissionGranted: event.isGpsPermissionsGranted,
      ),
    );
  }

  FutureOr<void> _onGpsInitialStatusEvent(
    GpsInitialStatusEvent event,
    Emitter<GpsPermissionsState> emit,
  ) {
    return emit.forEach(
      _gpsInitialStatus().asStream(),
      onData: ((data) => state.copyWith(
            isGpsEnabled: data,
          )),
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
