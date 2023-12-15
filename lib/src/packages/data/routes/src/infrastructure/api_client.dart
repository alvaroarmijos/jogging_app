import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/api_dtos.dart';
import 'package:tracking_app/src/packages/data/routes/src/infrastructure/routes_interceptor.dart';

class TrafficApiClient {
  TrafficApiClient()
      : _dioTraffic = Dio()..interceptors.add(TrafficInterceptor());

  final Dio _dioTraffic;

  final _baseTrafficUrl = 'https://api.mapbox.com/directions/v5/mapbox';

  Future<TrafficDto> getCoorsStartToEnd(LatLng start, LatLng end) async {
    final coorsString =
        "${start.longitude},${start.latitude};${end.longitude},${end.latitude}";
    final url = "$_baseTrafficUrl/walking/$coorsString";

    final resp = await _dioTraffic.get(url);

    final data = TrafficDto.fromMap(resp.data);

    return data;
  }
}
