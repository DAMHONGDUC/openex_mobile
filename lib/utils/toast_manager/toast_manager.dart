import 'package:bot_toast/bot_toast.dart';
import 'package:openex_mobile/core/common/app_enums.dart';
import 'package:openex_mobile/core/widgets/custom_toast.dart';

class ToastManager {
  static showNotificationToast(ToastType type, String? message) {
    BotToast.showCustomNotification(
      toastBuilder: (cancel) {
        return CustomToast(
          cancelFunc: cancel,
          type: type,
          message: message,
        );
      },
    );
  }
}
