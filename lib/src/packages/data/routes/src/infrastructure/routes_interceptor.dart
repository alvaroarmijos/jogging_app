import 'package:dio/dio.dart';

const accessToken =
    'pk.eyJ1IjoibGFsbzE1OTUiLCJhIjoiY2s4OHlqajE1MDFldDNlbzd5ZGtodnQycSJ9.vMDYnNVuC5gG4g1l9nD75w';

class TrafficInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'continue_straight': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken,
    });
    super.onRequest(options, handler);
  }
}
