part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

final class ChangeNameEvent extends OnboardingEvent {
  const ChangeNameEvent(this.name);

  final String name;
}

final class ChangeAgeEvent extends OnboardingEvent {
  const ChangeAgeEvent(this.age);

  final String age;
}

final class ChangeWeightEvent extends OnboardingEvent {
  const ChangeWeightEvent(this.weight);

  final String weight;
}

final class NextButtonPressedEvent extends OnboardingEvent {
  const NextButtonPressedEvent();
}
