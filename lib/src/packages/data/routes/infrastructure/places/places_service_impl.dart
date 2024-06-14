import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:tracking_app/src/packages/data/routes/domain/places/places.dart';
import 'package:tracking_app/src/packages/data/routes/domain/places/places_service.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/api_client.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/places/places_mapper.dart';

class PlacesServiceImpl extends PlacesService {
  final RoutesApiClient _apiClient;
  final PlacesMapper _mapper;

  PlacesServiceImpl(
    this._apiClient,
    this._mapper,
  );

  @override
  Stream<List<Place>> searchPlaces(LatLng proximity, String query) {
    return _apiClient
        .searchPlaces(proximity, query)
        .asStream()
        .map((dtos) => _mapper.fromApiDtoList(dtos));
  }
}
