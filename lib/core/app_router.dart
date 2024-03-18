import 'package:openex_mobile/features/login/ui/login_screen.dart';
import 'package:openex_mobile/features/app/ui/landing_screen.dart';
import 'package:openex_mobile/features/play_around/ui/play_around.dart';

class AppRoute {
  static const String LANDING = '/';
  static const String LOG_IN = '/signin';
  static const String PLAY_AROUND = '/play_around';
}

var appRoutes = {
  AppRoute.LANDING: (context) => const LandingScreen(),
  AppRoute.PLAY_AROUND: (context) => const PlayAroundScreen(),
  AppRoute.LOG_IN: (context) => const LoginScreen(),
};
