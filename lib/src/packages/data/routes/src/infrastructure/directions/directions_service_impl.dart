import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/directions/directions.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/directions/directions_service.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/api_client.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/directions/directions_mapper.dart';

class DirectionsServiceImpl implements DirectionsService {
  DirectionsServiceImpl(
    this._routesApiClient,
    this._trafficMapper,
  );

  final RoutesApiClient _routesApiClient;
  final DirectionsMapper _trafficMapper;

  @override
  Stream<Directions> getRouteByCoordinates(LatLng start, LatLng end) =>
      _routesApiClient
          .getCoorsStartToEnd(start, end)
          .asStream()
          .map((dtos) => _trafficMapper.fromApiDto(dtos));
}
