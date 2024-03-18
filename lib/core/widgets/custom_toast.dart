import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openex_mobile/core/resources/app_colors.dart';
import 'package:openex_mobile/core/resources/app_text_style.dart';

class CustomToast extends StatefulWidget {
  final CancelFunc cancelFunc;
  final Color backgroundColor;
  final String title;
  final String? message;

  const CustomToast(
      {Key? key,
      required this.cancelFunc,
      required this.backgroundColor,
      required this.title,
      this.message})
      : super(key: key);

  @override
  _CustomToastState createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: SizedBox(
        height: 64.sp,
        child: Card(
          color: AppColors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: double.infinity,
                      width: 5.w,
                      decoration: BoxDecoration(
                          color: widget.backgroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.h),
                              bottomLeft: Radius.circular(10.h))),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(6.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: AppTextStyle.base()
                                  .withColor(AppColors.black)
                                  .withColor(widget.backgroundColor),
                            ),
                            Text(
                              widget.message ?? "",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: AppTextStyle.small()
                                  .withColor(AppColors.black),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 16.sp,
                ),
                onPressed: widget.cancelFunc,
              )
            ],
          ),
        ),
      ),
    );
  }
}
