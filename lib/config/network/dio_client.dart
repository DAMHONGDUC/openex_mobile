import 'package:dio/dio.dart';
import 'package:openex_mobile/config/end_points.dart';
import 'package:openex_mobile/config/network/interceptors/authorization_interceptor.dart';
import 'package:openex_mobile/config/network/interceptors/logger_interceptor.dart';

class DioProvider {
  DioProvider._();

  static Dio? _primaryDio;
  static Dio? _authDio;

  static final Map<String, dynamic> _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  static Future<Dio> getDio([Dio? dio]) async {
    if (_primaryDio != null) {
      return _primaryDio!;
    }

    _primaryDio = await _getDio(dio: dio);
    return _primaryDio!;
  }

  static Future<Dio> _getDio({Dio? dio}) async {
    final resultDio = dio ?? Dio();

    resultDio.options = BaseOptions(
        baseUrl: Endpoints.BASE_URL,
        headers: _headers,
        connectTimeout: const Duration(seconds: Endpoints.CONNECT_TIMEOUT),
        receiveTimeout: const Duration(seconds: Endpoints.RECEIVE_TIMEOUT),
        responseType: ResponseType.json);

    resultDio.interceptors
        .addAll([AuthorizationInterceptor(), LoggerInterceptor()]);

    return resultDio;
  }
}
