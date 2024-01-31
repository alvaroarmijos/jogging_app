import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'directions.dart';

abstract class DirectionsService {
  Stream<Directions> getRoutesByCoordinates(LatLng start, LatLng end);
}
