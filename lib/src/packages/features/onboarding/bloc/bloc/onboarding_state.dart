part of 'onboarding_bloc.dart';

final class OnboardingState extends Equatable {
  const OnboardingState({
    this.name,
    this.email,
    this.age,
    this.weight,
    this.error,
  });

  final String? name;
  final String? email;
  final int? age;
  final double? weight;
  final Object? error;

  bool get showErrorAge => error != null ? error is InvalidAgeException : false;

  bool get showErrorWeight =>
      error != null ? error is InvalidWeightException : false;

  bool get showErrorEmail =>
      error != null ? error is InvalidEmailException : false;

  bool get showContinueButton =>
      (name ?? "").isNotEmpty &&
      (email ?? "").isNotEmpty &&
      (age ?? 0) > 0 &&
      (weight ?? 0) > 0;

  OnboardingState copyWith({
    String? name,
    String? email,
    int? age,
    double? weight,
    Object? error,
  }) =>
      OnboardingState(
        name: name ?? this.name,
        email: email ?? this.email,
        age: age ?? this.age,
        weight: weight ?? this.weight,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [name, email, age, weight, error];
}
