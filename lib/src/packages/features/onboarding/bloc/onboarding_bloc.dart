import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/src/packages/core/utility/utility.dart';
import 'package:tracking_app/src/packages/data/account/account.dart';
import 'package:tracking_app/src/packages/data/account/src/domain/user/user.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(
    this._inputConverter,
    this._saveUser,
  ) : super(const OnboardingState()) {
    on<ChangeNameEvent>(_onChangeNameEvent);
    on<ChangeAgeEvent>(_onChangeAgeEvent);
    on<ChangeWeightEvent>(_onChangeWeightEvent);
    on<NextButtonPressedEvent>(_onNextButtonPressedEvent);
  }

  final InputConverter _inputConverter;
  final SaveUser _saveUser;

  FutureOr<void> _onChangeNameEvent(
    ChangeNameEvent event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(name: event.name));
  }

  FutureOr<void> _onChangeAgeEvent(
    ChangeAgeEvent event,
    Emitter<OnboardingState> emit,
  ) {
    try {
      final age = _inputConverter.stringToUnsignedInteger(event.age);
      emit(state.copyWith(age: age, error: Object));
    } catch (e) {
      emit(state.copyWith(error: e, age: 0));
    }
  }

  FutureOr<void> _onChangeWeightEvent(
    ChangeWeightEvent event,
    Emitter<OnboardingState> emit,
  ) {
    try {
      final weight = _inputConverter.stringToUnsignedDouble(event.weight);
      emit(state.copyWith(weight: weight, error: Object));
    } catch (e) {
      emit(state.copyWith(error: e, weight: 0));
    }
  }

  FutureOr<void> _onNextButtonPressedEvent(
    NextButtonPressedEvent event,
    Emitter<OnboardingState> emit,
  ) {
    final user = User(state.name!, state.age!, state.weight!);
    _saveUser(user);
  }
}
