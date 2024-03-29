import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openex_mobile/core/resources/app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle xSmall() => TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  static TextStyle small() => TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  static TextStyle base() => TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  static TextStyle medium() => TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  static TextStyle large() => TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  static TextStyle xLarge() => TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  static TextStyle xxLarge() => TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black);
}

extension TextStyleExt on TextStyle {
  TextStyle wLight() => copyWith(fontWeight: FontWeight.w300);

  TextStyle wRegular() => copyWith(fontWeight: FontWeight.w400);

  TextStyle wMedium() => copyWith(fontWeight: FontWeight.w500);

  TextStyle wSemiBold() => copyWith(fontWeight: FontWeight.w600);

  TextStyle wBold() => copyWith(fontWeight: FontWeight.w700);

  TextStyle withColor(Color color) => copyWith(color: color);

  TextStyle size(double fontSize) => copyWith(fontSize: fontSize);

  TextStyle italic() => copyWith(fontStyle: FontStyle.italic);
}
