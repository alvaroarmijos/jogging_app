import 'package:dio/dio.dart';

const accessToken =
    'pk.eyJ1IjoibGFsbzE1OTUiLCJhIjoiY2s4OHlqajE1MDFldDNlbzd5ZGtodnQycSJ9.vMDYnNVuC5gG4g1l9nD75w';

class PlacesInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'access_token': accessToken,
      'language': 'es',
      'limit': 5,
    });

    super.onRequest(options, handler);
  }
}
