import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/api_dtos.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/places_interceptor.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/routes_interceptor.dart';

class RoutesApiClient {
  RoutesApiClient()
      : _dioTraffic = Dio()..interceptors.add(TrafficInterceptor()),
        _dioPlaces = Dio()..interceptors.add(PlacesInterceptor());

  final Dio _dioTraffic;
  final Dio _dioPlaces;

  final _baseTrafficUrl = 'https://api.mapbox.com/directions/v5/mapbox';
  final _basePlacesUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';

  Future<DirectionsDto> getCoorsStartToEnd(LatLng start, LatLng end) async {
    final coorsString =
        "${start.longitude},${start.latitude};${end.longitude},${end.latitude}";
    final url = "$_baseTrafficUrl/walking/$coorsString";

    final resp = await _dioTraffic.get(url);

    final data = DirectionsDto.fromMap(resp.data);

    return data;
  }

  Future<List<FeatureDto>> searchPlaces(LatLng proximity, String query) async {
    if (query.isEmpty) return [];

    final url = '$_basePlacesUrl/$query.json';

    final resp = await _dioPlaces.get(url, queryParameters: {
      'proximity': '${proximity.longitude},${proximity.latitude}',
      'limit': 5,
    });

    final placesResponse = PlacesDto.fromMap(resp.data);

    return placesResponse.features;
  }

  Future<FeatureDto> getPlaceInformation(LatLng point) async {
    final url = "$_basePlacesUrl/${point.longitude},${point.latitude}.json";
    final response = await _dioPlaces.get(url, queryParameters: {
      'limit': 1,
    });

    final placesResponse = PlacesDto.fromMap(response.data);

    return placesResponse.features[0];
  }
}
