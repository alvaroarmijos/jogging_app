import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/data/account/account.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
    this._checkUserExists,
  ) : super(const AppState()) {
    on<CheckExistUserEvent>(_onCheckExistUserEvent);
  }

  final CheckUserExists _checkUserExists;

  FutureOr<void> _onCheckExistUserEvent(
    CheckExistUserEvent event,
    Emitter<AppState> emit,
  ) {
    return emit.forEach(
      _checkUserExists(),
      onData: (data) => state.copyWith(userExists: data),
    );
  }
}
