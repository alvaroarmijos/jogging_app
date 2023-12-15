import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/traffic/traffic.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/traffic/traffic_service.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/api_client.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/traffic/traffic_mapper.dart';

class TrafficServiceImpl implements TrafficService {
  TrafficServiceImpl(
    this._trafficApiClient,
    this._trafficMapper,
  );

  final TrafficApiClient _trafficApiClient;
  final TrafficMapper _trafficMapper;

  @override
  Stream<Traffic> getRouteByCoordinates(LatLng start, LatLng end) =>
      _trafficApiClient
          .getCoorsStartToEnd(start, end)
          .asStream()
          .map((dtos) => _trafficMapper.fromApiDto(dtos));
}
