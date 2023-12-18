import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/directions/directions.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/directions/directions_service.dart';

class GetRoutes {
  GetRoutes(this._directionsService);

  final DirectionsService _directionsService;

  Stream<Directions> call(LatLng start, LatLng end) =>
      _directionsService.getRouteByCoordinates(start, end);
}
