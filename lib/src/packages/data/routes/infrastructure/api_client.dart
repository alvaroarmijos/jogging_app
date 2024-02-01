import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/api_dtos.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/routes_interceptors.dart';

class RoutesApiClient {
  RoutesApiClient()
      : _dioDirections = Dio()..interceptors.add(DirectionsInterceptor()),
        _dioPlaces = Dio()..interceptors.add(PlacesInterceptor());

  final Dio _dioDirections;
  final Dio _dioPlaces;

  final _baseDirectionsUrl = 'https://api.mapbox.com/directions/v5/mapbox';
  final _basePlacesUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';

  Future<DirectionsDto> getCoorsStartToEnd(LatLng start, LatLng end) async {
    try {
      final coorsString =
          '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';

      final url = '$_baseDirectionsUrl/walking/$coorsString';

      final resp = await _dioDirections.get(url);

      return DirectionsDto.fromJson(resp.data);
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<FeatureDto>> searchPlaces(LatLng proximity, String query) async {
    try {
      if (query.isEmpty) return [];

      final url = '$_basePlacesUrl/$query.json';

      final resp = await _dioPlaces.get(url, queryParameters: {
        'proximity': '${proximity.longitude},${proximity.latitude}',
      });

      final places = PlacesDto.fromJson(resp.data);

      return places.features;
    } catch (e) {
      throw Exception();
    }
  }
}
