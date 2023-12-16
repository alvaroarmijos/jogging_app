import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/routes.dart';
import 'package:tracking_app/src/packages/data/routes/src/domain/places/places_service.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/places/places_mapper.dart';

class PlacesServiceImpl implements PlacesService {
  PlacesServiceImpl(
    this._routesApiClient,
    this._placesMapper,
  );

  final RoutesApiClient _routesApiClient;
  final PlacesMapper _placesMapper;

  @override
  Stream<List<Place>> searchPlaces(LatLng proximity, String query) =>
      _routesApiClient
          .searchPlaces(proximity, query)
          .asStream()
          .map((dtos) => _placesMapper.fromApiDtoList(dtos));
}
