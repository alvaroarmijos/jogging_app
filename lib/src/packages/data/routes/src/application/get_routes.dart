import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/traffic/traffic.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/traffic/traffic_service.dart';

class GetRoutes {
  GetRoutes(this._trafficService);

  final TrafficService _trafficService;

  Stream<Traffic> call(LatLng start, LatLng end) =>
      _trafficService.getRouteByCoordinates(start, end);
}
