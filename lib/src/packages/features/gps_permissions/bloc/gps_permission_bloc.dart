import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tracking_app/src/packages/data/device/application/application.dart';

part 'gps_permission_event.dart';
part 'gps_permission_state.dart';

class GpsPermissionBloc extends Bloc<GpsPermissionEvent, GpsPermissionState> {
  GpsPermissionBloc(
    this._gpsInitialStatus,
    this._gpsStatus,
    this._askGpsPermissions,
    this._appSettings,
    this._checkPermissions,
  ) : super(const GpsPermissionState()) {
    on<GpsAndPermissionEvent>(_onGpsAndPermissionEvent);
    on<GpsInitialStatusEvent>(_onGpsInitialStatusEvent);
    on<ChangeGpsStatusEvent>(_onChangeGpsStatusEvent);
    on<AskGpsAccessEvent>(_onAskGpsAccessEvent);
    on<OpenAppSettingsEvent>(_onOpenAppSettingsEvent);

    _init();
  }

  final GpsInitialStatus _gpsInitialStatus;
  final GpsStatus _gpsStatus;
  final AskGpsPermissions _askGpsPermissions;
  final OpenAppSettings _appSettings;
  final CheckPermissions _checkPermissions;

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
    return emit.forEach(
        // _gpsStatus(),
        Rx.combineLatest2(
          _gpsStatus(),
          _checkPermissions(),
          (isGpsEnabled, isPermissionEnabled) =>
              (isGpsEnabled, isPermissionEnabled),
        ), onData: (data) {
      return state.copyWith(
        isGpsEnable: data.$1,
        isGpsPermissionGranted: data.$2,
      );
    });
  }

  void _init() {
    add(const GpsInitialStatusEvent());
    add(const ChangeGpsStatusEvent());
  }

  FutureOr<void> _onAskGpsAccessEvent(
    AskGpsAccessEvent event,
    Emitter<GpsPermissionState> emit,
  ) {
    return emit.forEach(_askGpsPermissions(), onData: (data) {
      if (!data) add(const OpenAppSettingsEvent());

      return state.copyWith(isGpsPermissionGranted: data);
    });
  }

  FutureOr<void> _onOpenAppSettingsEvent(
    OpenAppSettingsEvent event,
    Emitter<GpsPermissionState> emit,
  ) {
    return emit.onEach(
      _appSettings().asStream(),
      onData: (_) {},
    );
  }
}
