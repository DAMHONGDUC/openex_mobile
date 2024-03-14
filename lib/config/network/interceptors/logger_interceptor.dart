import 'package:dio/dio.dart';
import 'package:openex_mobile/utils/log/log.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException dioExeption, ErrorInterceptorHandler handler) {
    final options = dioExeption.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    Log.e(options.method, 'request => $requestPath');
    Log.d('Error: ${dioExeption.error}, Message: ${dioExeption.message}');

    return super.onError(dioExeption, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';

    Log.i('${options.method} request => $requestPath');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.d('StatusCode: ${response.statusCode}, Data: ${response.data}');

    return super.onResponse(response, handler);
  }
}
