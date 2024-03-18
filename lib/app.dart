import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openex_mobile/core/app_router.dart';
import 'package:openex_mobile/core/common/app_constants.dart';
import 'package:openex_mobile/core/themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:openex_mobile/data/repository/auth_repository.dart';
import 'package:openex_mobile/features/app/bloc/app_cubit.dart';
import 'package:openex_mobile/features/auth/bloc/auth_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [_configAuthRepository()],
        child: MultiBlocProvider(
            providers: [_configAppCubit(), _configAuthBloc()],
            child: ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              child: BlocBuilder<AppCubit, AppState>(
                builder: (context, appState) {
                  return MaterialApp(
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    locale: Locale(appState.language.currentLang),
                    builder: BotToastInit(),
                    navigatorObservers: [BotToastNavigatorObserver()],
                    title: AppConstants.APP_NAME,
                    theme: lightTheme,
                    initialRoute: AppRoute.LANDING,
                    routes: appRoutes,
                    debugShowCheckedModeBanner: false,
                  );
                },
              ),
            )));
  }

  RepositoryProvider<AuthRepository> _configAuthRepository() {
    return RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepository(),
      lazy: true,
    );
  }

  BlocProvider<AuthBloc> _configAuthBloc() {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        UninitAuthState(),
        RepositoryProvider.of<AuthRepository>(context),
      )..add(
          AuthStartedEvent(),
        ),
    );
  }

  BlocProvider<AppCubit> _configAppCubit() {
    return BlocProvider<AppCubit>(
        create: (BuildContext context) => AppCubit()..loadLanguage());
  }
}
