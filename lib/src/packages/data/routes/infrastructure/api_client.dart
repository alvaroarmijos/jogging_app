import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/api_dtos.dart';
import 'package:tracking_app/src/packages/data/routes/infrastructure/routes_interceptors.dart';

class RoutesApiClient {
  RoutesApiClient()
      : _dioDirections = Dio()..interceptors.add(DirectionsInterceptor());

  final Dio _dioDirections;

  final _baseDirectionsUrl = 'https://api.mapbox.com/directions/v5/mapbox';

  Future<DirectionsDto> getCoorsStartToEnd(LatLng start, LatLng end) async {
    // try {
    final coorsString =
        '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';

    final url = '$_baseDirectionsUrl/walking/$coorsString';

    final resp = await _dioDirections.get(url);

    final data = DirectionsDto.fromJson(resp.data);

    return data;
    // } catch (e) {
    //   throw Exception();
    // }
  }
}
