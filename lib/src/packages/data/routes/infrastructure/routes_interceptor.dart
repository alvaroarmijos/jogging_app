import 'package:dio/dio.dart';

class RoutesInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': false,
      'continue_straight': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token':
          'pk.eyJ1IjoibGFsbzE1OTUiLCJhIjoiY2x4Y2l0NjJuM2xsaDJpcHZiZHkwNzQ1eiJ9.MTZiCSGz3DgoP-1kqdOQUg',
    });
    super.onRequest(options, handler);
  }
}
