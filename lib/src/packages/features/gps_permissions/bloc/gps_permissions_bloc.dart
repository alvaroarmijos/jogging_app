import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tracking_app/src/packages/data/device/application.dart';

part 'gps_permissions_event.dart';
part 'gps_permissions_state.dart';

class GpsPermissionsBloc
    extends Bloc<GpsPermissionsEvent, GpsPermissionsState> {
  GpsPermissionsBloc(
    this._gpsCurrentStatus,
    this._gpsStatus,
    this._askGpsAccess,
    this._openAppSettings,
    this._checkPermissionGranted,
  ) : super(const GpsPermissionsState()) {
    on<GpsAndPermissionEvent>(_onGpsAndPermissionEvent);
    on<GpsInitialStatusEvent>(_onGpsInitialStatusEvent);
    on<ChangeGpsStatusEvent>(_onChangeGpsStatusEvent);
    on<AskGpsAccessEvent>(_onAskGpsAccessEvent);
    on<OpenAppSettingsEvent>(_onOpenAppSettingsEvent);

    _init();
  }

  final GpsCurrentStatus _gpsCurrentStatus;
  final GpsStatus _gpsStatus;
  final AskGpsAccess _askGpsAccess;
  final OpenAppSettings _openAppSettings;
  final CheckPermissionGranted _checkPermissionGranted;

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
      Rx.combineLatest2(
          _gpsCurrentStatus().asStream(),
          _checkPermissionGranted(),
          (isEnabled, isGranted) => (isEnabled, isGranted)),
      onData: (data) => state.copyWith(
        isGpsEnabled: data.$1,
        isGpsPermissionGranted: data.$2,
      ),
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

  FutureOr<void> _onAskGpsAccessEvent(
    AskGpsAccessEvent event,
    Emitter<GpsPermissionsState> emit,
  ) {
    return emit.forEach(_askGpsAccess(), onData: (data) {
      if (!data) add(const OpenAppSettingsEvent());
      return state.copyWith(isGpsPermissionGranted: data);
    });
  }

  FutureOr<void> _onOpenAppSettingsEvent(
    OpenAppSettingsEvent event,
    Emitter<GpsPermissionsState> emit,
  ) {
    return emit.onEach(_openAppSettings().asStream(), onData: (_) {});
  }
}
