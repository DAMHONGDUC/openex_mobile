import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openex_mobile/core/resources/app_colors.dart';
import 'package:openex_mobile/core/resources/app_text_style.dart';

class PositiveButton extends StatelessWidget {
  const PositiveButton({
    required this.title,
    this.onPressed,
    this.foregroundColor = AppColors.white,
    this.backgroundColor = AppColors.gray95,
    this.textStyle,
    this.prefix,
    this.height,
    this.width,
    this.elevation = 3,
    this.stretchWidth = true,
    this.borderRadius,
    this.uppercase = true,
    this.padding,
    this.prefixSpacing,
    this.isLoading = false,
    super.key,
  });

  final String title;
  final void Function()? onPressed;
  final Color foregroundColor;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final Widget? prefix;
  final double? height;
  final double? width;
  final double? elevation;
  final bool stretchWidth;
  final double? borderRadius;
  final bool uppercase;
  final EdgeInsets? padding;
  final double? prefixSpacing;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 42.h,
      width: width ?? (stretchWidth ? double.infinity : null),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: backgroundColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 4)),
          padding: padding,
        ),
        onPressed: onPressed,
        child: isLoading
            ? Padding(
                padding: EdgeInsets.all(8.h),
                child: Center(
                    child: CircularProgressIndicator(
                        color: AppColors.white, strokeWidth: 3.r)),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefix != null) prefix!,
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        uppercase ? title.toUpperCase() : title,
                        style: textStyle ??
                            AppTextStyle.base()
                                .wBold()
                                .withColor(foregroundColor),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
