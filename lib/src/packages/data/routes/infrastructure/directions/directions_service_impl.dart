import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:tracking_app/src/packages/data/routes/domain/directions/directions.dart';
import 'package:tracking_app/src/packages/data/routes/domain/directions/directions_service.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/api_client.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/directions/directions_mapper.dart';

class DirectionsServiceImpl extends DirectionsService {
  DirectionsServiceImpl(
    this._apiClient,
    this._mapper,
  );

  final RoutesApiClient _apiClient;
  final DirectionsMapper _mapper;

  @override
  Stream<Directions> getRouteByCoordinates(LatLng start, LatLng end) {
    return _apiClient
        .getRouteStartToEnd(start, end)
        .asStream()
        .map((dto) => _mapper.fromApiDto(dto));
  }
}
