import 'package:dio/dio.dart';
import 'package:openex_mobile/core/common/app_enums.dart';
import 'package:openex_mobile/core/network/dio/dio_exception.dart';
import 'package:openex_mobile/utils/toast_manager/toast_manager.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final errorMessage = DioExceptionCustom.fromDioError(err).toString();
    ToastManager.showNotificationToast(ToastType.Error, errorMessage);

    handler.reject(err);
  }
}
