part of 'map_bloc.dart';

final class MapState extends Equatable {
  const MapState({
    this.isMapInitialized = false,
  });

  final bool isMapInitialized;

  MapState copyWith({
    bool? isMapInitialized,
  }) =>
      MapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
      );

  @override
  List<Object> get props => [isMapInitialized];
}
