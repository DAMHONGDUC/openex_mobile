import 'package:openex_mobile/features/app/ui/app.dart';
import 'package:openex_mobile/features/auth/ui/login_screen.dart';
import 'package:openex_mobile/features/play_around/ui/play_around.dart';

class AppRoute {
  static const String APP = '/';
  static const String HOME = '/home';
  static const String LOG_IN = '/signin';
  static const String PLAY_AROUND = '/play_around';
}

var appRoutes = {
  AppRoute.APP: (context) => const App(),
  AppRoute.PLAY_AROUND: (context) => const PlayAroundScreen(),
  AppRoute.LOG_IN: (context) => const LoginScreen(),
};
