import 'package:dio/dio.dart';
import 'package:openex_mobile/core/network/dio/dio_client.dart';
import 'package:openex_mobile/core/network/dio/dio_exception.dart';
import 'package:openex_mobile/utils/log/log.dart';
import 'package:flutter/foundation.dart';

class DioService {
  static Future<Response<T>> get<T>(String url) async {
    try {
      Dio dioClient = await DioClient.getDio();
      final Response<T> response = await dioClient.get<T>(url);

      return response;
    } on DioException catch (err) {
      final errorMessage = DioExceptionCustom.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        Log.e("GET: $url", e.toString());
      }
      throw e.toString();
    }
  }

  static Future<Response<T>> post<T>(String url, Object? dataRequest) async {
    try {
      Dio dioClient = await DioClient.getDio();
      final Response<T> response =
          await dioClient.post<T>(url, data: dataRequest);

      return response;
    } on DioException catch (err) {
      final errorMessage = DioExceptionCustom.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        Log.e("POST: $url", e.toString());
      }
      throw e.toString();
    }
  }
}
