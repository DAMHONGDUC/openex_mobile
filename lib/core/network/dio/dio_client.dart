import 'package:dio/dio.dart';
import 'package:openex_mobile/core/network/end_points.dart';
import 'package:openex_mobile/core/network/interceptors/authorization_interceptor.dart';
import 'package:openex_mobile/core/network/interceptors/error_interceptor.dart';
import 'package:openex_mobile/core/network/interceptors/logger_interceptor.dart';

class DioClient {
  DioClient._();

  static Dio? _dio;

  static final Map<String, dynamic> _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  static Future<Dio> getDio([Dio? dio]) async {
    if (_dio != null) {
      return _dio!;
    }

    _dio = await _getDio(dio: dio);
    return _dio!;
  }

  static Future<Dio> _getDio({Dio? dio}) async {
    final resultDio = dio ?? Dio();

    resultDio.options = BaseOptions(
        baseUrl: Endpoints.BASE_URL,
        headers: _headers,
        connectTimeout: const Duration(seconds: Endpoints.CONNECT_TIMEOUT),
        receiveTimeout: const Duration(seconds: Endpoints.RECEIVE_TIMEOUT),
        responseType: ResponseType.json);

    resultDio.interceptors.addAll(
        [AuthorizationInterceptor(), LoggerInterceptor(), ErrorInterceptor()]);

    return resultDio;
  }
}
