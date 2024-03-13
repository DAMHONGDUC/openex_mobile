import 'package:flutter/material.dart';
import 'package:openex_mobile/config/app_router.dart';
import 'package:openex_mobile/resources/colors.dart';
import 'package:openex_mobile/resources/text_style.dart';

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
      appBar: AppBar(
        backgroundColor: AppColors.primary_light,
        title: Text(
          "Login",
          style: AppTextStyle.small()
              .withColor(AppColors.text_black)
              .copyWith(fontSize: 20),
        ),
      ),
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(child: Text("login"))),
      ),
    ));
  }
}
