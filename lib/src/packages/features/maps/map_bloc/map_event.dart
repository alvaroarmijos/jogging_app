part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class MapInitializeEvent extends MapEvent {
  const MapInitializeEvent(this.controller);

  final GoogleMapController controller;
}
