import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openex_mobile/core/widgets/loading_indicator.dart';
import 'package:openex_mobile/data/repository/auth_repository.dart';
import 'package:openex_mobile/features/auth/bloc/auth_bloc.dart';
import 'package:openex_mobile/features/auth/ui/login_screen.dart';
import 'package:openex_mobile/features/play_around/ui/play_around.dart';
import 'package:openex_mobile/utils/log/log.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _bloc = AuthBloc(UninitAuthState(), AuthRepository());

  @override
  Widget build(BuildContext context) {
    Log.d("build app");
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) =>
          debugPrint("[LANDING PAGE] Receiving event: $state"),
      builder: (context, state) {
        Log.d(state);
        if (state is AuthenticatedState) {
          return const PlayAroundScreen();
        } else if (state is UnauthenticatedState)
          return const LoginScreen();
        else
          return const LoadingIndicator();
      },
    );
  }
}
