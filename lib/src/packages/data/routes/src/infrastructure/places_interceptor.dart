import 'package:dio/dio.dart';

const accessToken = 'your_api_key';


class PlacesInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'access_token': accessToken,
      'language': 'es',
    });

    super.onRequest(options, handler);
  }
}
