part of 'onboarding_bloc.dart';

final class OnboardingState extends Equatable {
  const OnboardingState({
    this.name,
    this.age,
    this.weight,
    this.error,
    this.email,
  });

  final String? name;
  final int? age;
  final double? weight;
  final String? email;
  final Object? error;

  bool get showErrorAge => error != null ? error is InvalidAgeException : false;

  bool get showErrorEmail =>
      error != null ? error is InvalidEmailException : false;

  bool get showErrorWeight =>
      error != null ? error is InvalidWeightException : false;

  bool get isNextButtonEnabled =>
      (name?.isNotEmpty ?? false) &&
      (email?.isNotEmpty ?? false) &&
      (age ?? 0) > 0 &&
      (weight ?? 0) > 0;

  OnboardingState copyWith({
    String? name,
    int? age,
    double? weight,
    Object? error,
    String? email,
  }) {
    return OnboardingState(
      name: name ?? this.name,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      error: error ?? this.error,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [name, age, weight, error, email];
}
