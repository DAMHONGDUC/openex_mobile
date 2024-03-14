import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openex_mobile/config/app_router.dart';
import 'package:openex_mobile/screens/auth/login_screen.dart';
import 'package:openex_mobile/screens/test/test.dart';
import 'package:openex_mobile/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Open-ex app',
        theme: lightTheme,
        initialRoute: AppRoute.TEST,
        routes: {
          AppRoute.TEST: (context) => const TestScreen(),
          AppRoute.LOG_IN: (context) => const LoginScreen(),
        },
      ),
    );
  }
}
