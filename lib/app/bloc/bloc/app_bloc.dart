import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracking_app/src/packages/data/account/account.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
    this._checkUserExists,
  ) : super(const AppState()) {
    on<CheckUserExistsEvent>(_onCheckUserExistsEvent);
  }

  final CheckUserExists _checkUserExists;

  FutureOr<void> _onCheckUserExistsEvent(
    CheckUserExistsEvent event,
    Emitter<AppState> emit,
  ) {
    return emit.forEach(
      _checkUserExists(),
      onData: (userExists) => state.copyWith(userExists: userExists),
    );
  }
}
