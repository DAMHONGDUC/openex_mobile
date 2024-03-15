import 'package:dio/dio.dart';
import 'package:openex_mobile/core/network/end_points.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${Endpoints.API_KEY}';

    super.onRequest(options, handler);
  }
}
