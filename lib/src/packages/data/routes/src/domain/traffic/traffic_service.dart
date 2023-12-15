import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/traffic/traffic.dart';

abstract class TrafficService {
  Stream<Traffic> getRouteByCoordinates(LatLng start, LatLng end);
}
