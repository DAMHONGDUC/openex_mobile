import 'package:flutter/material.dart';
import 'package:openex_mobile/config/app_router.dart';
import 'package:openex_mobile/resources/colors.dart';
import 'package:openex_mobile/resources/text_style.dart';
import 'package:openex_mobile/utils/log/log.dart';

class TestScreen extends StatefulWidget {
  static const route = AppRoute.LOG_IN;
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: Text(
                "Test Screen",
                style: AppTextStyle.small()
                    .withColor(AppColors.black)
                    .copyWith(fontSize: 20),
              ),
            ),
            backgroundColor: AppColors.white,
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Test"),
                    ElevatedButton(
                        onPressed: () => {Log.d("Log debug")},
                        child: Text("Click"))
                  ],
                ),
              ),
            )));
  }
}
