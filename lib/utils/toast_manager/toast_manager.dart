import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:openex_mobile/core/common/app_enums.dart';
import 'package:openex_mobile/core/resources/app_colors.dart';
import 'package:openex_mobile/core/widgets/custom_toast.dart';

class ToastManager {
  static showNotificationToast(ToastType type, String? message) {
    Color backgroundColor;
    String title;

    switch (type) {
      case ToastType.Success:
        backgroundColor = AppColors.success;
        title = "Success";
        break;
      case ToastType.Error:
        backgroundColor = AppColors.error;
        title = "Error";
        break;
      case ToastType.Waring:
        backgroundColor = AppColors.black;
        title = "Warning";
        break;
      case ToastType.Info:
        backgroundColor = AppColors.black;
        title = "Info";
        break;
    }

    BotToast.showCustomNotification(
      toastBuilder: (cancel) {
        return CustomToast(
          cancelFunc: cancel,
          title: title,
          message: message,
          backgroundColor: backgroundColor,
        );
      },
    );
  }
}
