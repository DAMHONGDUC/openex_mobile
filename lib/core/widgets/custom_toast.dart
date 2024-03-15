import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openex_mobile/core/common/app_enums.dart';
import 'package:openex_mobile/core/resources/app_colors.dart';
import 'package:openex_mobile/core/resources/app_text_style.dart';

class CustomToast extends StatefulWidget {
  final CancelFunc cancelFunc;
  final ToastType type;
  final String? message;

  const CustomToast(
      {Key? key, required this.cancelFunc, required this.type, this.message})
      : super(key: key);

  @override
  _CustomToastState createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> {
  bool loveMe = true;

  String getToastTitle(ToastType type) {
    switch (type) {
      case ToastType.Success:
        {
          return "Success";
        }
      case ToastType.Error:
        {
          return "Error";
        }
      case ToastType.Waring:
        {
          return "Warning";
        }
      case ToastType.Info:
        {
          return "Info";
        }
      default:
        {
          return "Success";
        }
    }
  }

  Color getToastColor(ToastType type) {
    switch (type) {
      case ToastType.Success:
        {
          return AppColors.success;
        }
      case ToastType.Error:
        {
          return AppColors.error;
        }
      case ToastType.Waring:
        {
          return AppColors.black;
        }
      case ToastType.Info:
        {
          return AppColors.black;
        }
      default:
        {
          return AppColors.black;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    String toastTitle = getToastTitle(widget.type);
    Color toastColor = getToastColor(widget.type);

    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: Card(
        color: toastColor,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 10.sp,
                  ),
                  Text(
                    "$toastTitle: ",
                    style: AppTextStyle.medium().withColor(AppColors.white),
                  ),
                  Text(
                    widget.message ?? "",
                    style: AppTextStyle.medium().withColor(AppColors.white),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.cancel),
              color: loveMe ? Colors.redAccent : Colors.grey,
              onPressed: widget.cancelFunc,
            )
          ],
        ),
      ),
    );
  }
}
