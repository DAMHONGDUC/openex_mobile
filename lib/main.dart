import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openex_mobile/blocs/language/language_cubit.dart';
import 'package:openex_mobile/common/constants.dart';
import 'package:openex_mobile/config/app_router.dart';
import 'package:openex_mobile/screens/auth/login_screen.dart';
import 'package:openex_mobile/screens/play_around/play_around.dart';
import 'package:openex_mobile/themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MultiBlocProvider(providers: <BlocProvider<dynamic>>[
    BlocProvider<LanguageCubit>(
        create: (BuildContext context) => LanguageCubit()..loadLanguage())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return ScreenUtilInit(
          minTextAdapt: true,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(state.currentLang),
            debugShowCheckedModeBanner: false,
            title: AppConstant.APP_NAME,
            theme: lightTheme,
            initialRoute: AppRoute.PLAY_AROUND,
            routes: {
              AppRoute.PLAY_AROUND: (context) => const PlayAroundScreen(),
              AppRoute.LOG_IN: (context) => const LoginScreen(),
            },
          ),
        );
      },
    );
  }
}
