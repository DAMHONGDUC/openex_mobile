import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openex_mobile/core/app_router.dart';
import 'package:openex_mobile/core/common/app_constants.dart';
import 'package:openex_mobile/core/themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:openex_mobile/features/app/bloc/app_cubit.dart';

void main() {
  runApp(MultiBlocProvider(providers: <BlocProvider<dynamic>>[
    BlocProvider<AppCubit>(
        create: (BuildContext context) => AppCubit()..loadLanguage())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(appState.language.currentLang),
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            title: AppConstants.APP_NAME,
            theme: lightTheme,
            initialRoute: AppRoute.PLAY_AROUND,
            routes: appRoutes,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
