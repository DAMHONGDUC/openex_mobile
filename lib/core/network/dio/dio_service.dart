import 'package:dio/dio.dart';
import 'package:openex_mobile/core/common/app_enums.dart';
import 'package:openex_mobile/core/network/dio/dio_client.dart';
import 'package:openex_mobile/utils/toast_manager/toast_manager.dart';

class DioService {
  static Future<Response?> get(String url) async {
    try {
      Dio dioClient = await DioClient.getDio();
      final Response response = await dioClient.get(url);

      return response;
    } on DioException {
      // already handle in error_interceptor
    } catch (e) {
      ToastManager.showNotificationToast(ToastType.Error, e.toString());
    }
    return null;
  }

  static Future<Response?> post(String url, Object? dataRequest) async {
    try {
      Dio dioClient = await DioClient.getDio();
      final Response response = await dioClient.post(url, data: dataRequest);

      return response;
    } on DioException {
      // already handle in error_interceptor
    } catch (e) {
      ToastManager.showNotificationToast(ToastType.Error, e.toString());
    }
    return null;
  }
}
