import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openex_mobile/core/app_router.dart';
import 'package:openex_mobile/core/resources/app_colors.dart';
import 'package:openex_mobile/core/resources/app_text_style.dart';
import 'package:openex_mobile/features/login/ui/login_form.dart';

class LoginScreen extends StatefulWidget {
  static const route = AppRoute.LOG_IN;
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login",
              style:
                  AppTextStyle.xxLarge().copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20.h,
            ),
            const LoginForm()
          ],
        ),
      )),
    ));
  }
}
