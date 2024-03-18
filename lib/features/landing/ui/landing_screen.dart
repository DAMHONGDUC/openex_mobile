import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openex_mobile/core/widgets/loading_indicator.dart';
import 'package:openex_mobile/features/auth/bloc/auth_bloc.dart';
import 'package:openex_mobile/features/auth/ui/login_screen.dart';
import 'package:openex_mobile/features/play_around/ui/play_around.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // Log.d("[LANDING PAGE] Receiving event: $state");
      },
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return const PlayAroundScreen();
        } else if (state is UnauthenticatedState) {
          return const LoginScreen();
        } else if (state is LoadingAuthenticationState) {
          return const LoadingIndicator();
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}
