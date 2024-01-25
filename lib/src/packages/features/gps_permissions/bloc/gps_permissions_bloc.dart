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
    this._askGpsAccess,
    this._openAppSettins,
    this._checkPermissionsGranted,
  ) : super(const GpsPermissionsState()) {
    // on<GpsAndPermissionsEvent>(_onGpsAndPermissionsEvent);
    on<GpsInitialStatusEvent>(_onGpsInitialStatusEvent);
    on<ChangeGpsStatusEvent>(_onChangeGpsStatusEvent);
    on<AskGpsAccessEvent>(_onAskGpsAccessEvent);
    on<OpenAppSettinsEvent>(_onOpenAppSettinsEvent);

    _init();
  }

  final GpsInitialStatus _gpsInitialStatus;
  final GpsStatus _gpsStatus;
  final AskGpsAccess _askGpsAccess;
  final OpenAppSettins _openAppSettins;
  final CheckPermissionsGranted _checkPermissionsGranted;

  // FutureOr<void> _onGpsAndPermissionsEvent(
  //   GpsAndPermissionsEvent event,
  //   Emitter<GpsPermissionsState> emit,
  // ) {
  //   emit(
  //     state.copyWith(
  //       isGpsEnabled: event.isGpsEnabled,
  //       isGpsPermissionGranted: event.isGpsPermissionsGranted,
  //     ),
  //   );
  // }

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

  FutureOr<void> _onAskGpsAccessEvent(
    AskGpsAccessEvent event,
    Emitter<GpsPermissionsState> emit,
  ) {
    return emit.forEach(
      _askGpsAccess(),
      onData: (data) {
        if (!data) add(const OpenAppSettinsEvent());
        return state.copyWith(isGpsPermissionGranted: data);
      },
    );
  }

  FutureOr<void> _onOpenAppSettinsEvent(
    OpenAppSettinsEvent event,
    Emitter<GpsPermissionsState> emit,
  ) {
    return emit.onEach(
      _openAppSettins().asStream(),
      onData: (_) {},
    );
  }
}
