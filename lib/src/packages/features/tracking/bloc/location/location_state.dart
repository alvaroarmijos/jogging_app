part of 'location_bloc.dart';

final class LocationState extends Equatable {
  const LocationState({this.followingUser = false});

  final bool followingUser;

  @override
  List<Object> get props => [followingUser];
}
