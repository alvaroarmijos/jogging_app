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
    on<ChangeEmailEvent>(_onChangeEmailEvent);
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
    final user = User(state.name!, state.age!, state.weight!, state.email!);
    _saveUser(user);
  }

  FutureOr<void> _onChangeEmailEvent(
    ChangeEmailEvent event,
    Emitter<OnboardingState> emit,
  ) {
    final isValidEmail = _inputConverter.isValidEmail(event.email);
    if (isValidEmail) {
      emit(state.copyWith(email: event.email, error: Object));
    } else {
      emit(state.copyWith(error: const InvalidEmailException(), email: ''));
    }
  }
}
