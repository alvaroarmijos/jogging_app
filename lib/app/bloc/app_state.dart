part of 'app_bloc.dart';

final class AppState extends Equatable {
  const AppState({
    this.userExists = false,
  });

  final bool userExists;

  AppState copyWith({
    bool? userExists,
  }) {
    return AppState(
      userExists: userExists ?? this.userExists,
    );
  }

  @override
  List<Object> get props => [userExists];
}
