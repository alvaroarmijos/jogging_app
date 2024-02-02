import 'package:dio/dio.dart';

const accessToken =
    'pk.eyJ1IjoibGFsbzE1OTUiLCJhIjoiY2xyenA2Zjd0MXR0ZTJxdW9pOWx0cjF1YyJ9.4rTH3EGkp24ZaTUtuks1Tg';

class DirectionsInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'steps': false,
      'alternatives': true,
      'continue_straight': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'access_token': accessToken,
    });
    super.onRequest(options, handler);
  }
}

class PlacesInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'language': 'es',
      'access_token': accessToken,
    });
    super.onRequest(options, handler);
  }
}
