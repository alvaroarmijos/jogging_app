import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/directions/directions.dart';

abstract class DirectionsService {
  Stream<Directions> getRouteByCoordinates(LatLng start, LatLng end);
}
