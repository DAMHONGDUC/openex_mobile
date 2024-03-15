import 'package:dio/dio.dart';
import 'package:openex_mobile/core/network/dio/dio_client.dart';

class DioService {
  static Future<dynamic> get(String url) async {
    try {
      Dio dioClient = await DioClient.getDio();
      final response = await dioClient.get(url);

      return response;
    } catch (err) {}
  }

  static Future<Response<T>> post<T>(String url, Object? request) async {
    try {
      Dio dioClient = await DioClient.getDio();
      final Response<T> response = await dioClient.post(url, data: request);

      return response;
    } catch (err) {
      rethrow;
    }
  }

  static Future<dynamic> put(String url) async {}

  static Future<dynamic> delete(String url) async {}

  static Future<dynamic> uploadFiles(String url) async {}
}
