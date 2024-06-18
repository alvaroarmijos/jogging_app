import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/api_dtos.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/routes_interceptor.dart';

class RoutesApiClient {
  RoutesApiClient()
      : _dioDirections = Dio()..interceptors.add(RoutesInterceptor()),
        _dioPlaces = Dio()..interceptors.add(PlacesInterceptor());

  final Dio _dioDirections;
  final Dio _dioPlaces;

  final _baseDirectionsUrl = 'https://api.mapbox.com/directions/v5/mapbox';
  final _basePlacesUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';

  Future<DirectionsDto> getRouteStartToEnd(LatLng start, LatLng end) async {
    final coorsString =
        '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';

    final url = '$_baseDirectionsUrl/walking/$coorsString';

    final response = await _dioDirections.get(url);

    final data = DirectionsDto.fromJson(response.data);

    return data;
  }

  Future<List<FeatureDto>> searchPlaces(LatLng proximity, String query) async {
    if (query.trim().isEmpty) return [];

    final url = '$_basePlacesUrl/$query.json';

    final response = await _dioPlaces.get(url, queryParameters: {
      'limit': 7,
      'proximity': '${proximity.longitude},${proximity.latitude}'
    });

    final data = PlacesDto.fromJson(response.data);

    return data.features ?? [];
  }

  Future<FeatureDto?> reverseGeocoding(LatLng point) async {
    final url = '$_basePlacesUrl/${point.longitude},${point.latitude}.json';

    final response = await _dioPlaces.get(url, queryParameters: {
      'limit': 1,
    });

    final data = PlacesDto.fromJson(response.data);

    return data.features?.first;
  }
}
