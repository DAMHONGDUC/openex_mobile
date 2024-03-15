import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openex_mobile/core/app_router.dart';
import 'package:openex_mobile/core/common/app_constants.dart';
import 'package:openex_mobile/core/common/app_enums.dart';
import 'package:openex_mobile/core/network/end_points.dart';
import 'package:openex_mobile/core/resources/app_colors.dart';
import 'package:openex_mobile/core/resources/app_text_style.dart';
import 'package:openex_mobile/data/repository/auth_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:openex_mobile/features/app/bloc/app_cubit.dart';
import 'package:openex_mobile/utils/log/log.dart';
import 'package:openex_mobile/utils/toast_manager/toast_manager.dart';

class PlayAroundScreen extends StatefulWidget {
  static const route = AppRoute.LOG_IN;
  const PlayAroundScreen({super.key});

  @override
  State<PlayAroundScreen> createState() => _PlayAroundScreenState();
}

class _PlayAroundScreenState extends State<PlayAroundScreen> {
  @override
  Widget build(BuildContext context) {
    void changeLanguage(String languageCode) {
      context.read<AppCubit>().changeLanguage(languageCode);
    }

    void testCallAPI() async {
      Log.d("test call API");
      final AuthRepository authRepository = AuthRepository();

      final resp =
          await authRepository.login(Endpoints.LOGIN, "kminchelle", "0lelplR");

      Log.d("testCallAPI: ${resp?.email}");
    }

    void showMotionToast() {
      ToastManager.showNotificationToast(
          ToastType.Error, "Some thing went wrong");
    }

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: Text("Test Screen32222",
                  style: AppTextStyle.large().withColor(AppColors.black)),
            ),
            backgroundColor: AppColors.white,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(AppLocalizations.of(context)!.helloWorld),
                    ElevatedButton(
                        onPressed: () => {changeLanguage(LanguageCode.EN)},
                        child: const Text("Change app language to English")),
                    ElevatedButton(
                        onPressed: () => {changeLanguage(LanguageCode.JA)},
                        child: const Text("Change app language to Japan")),
                    ElevatedButton(
                        onPressed: () => {testCallAPI()},
                        child: const Text("Test Call API")),
                    ElevatedButton(
                        onPressed: () => {showMotionToast()},
                        child: const Text("Show Toast"))
                  ],
                ),
              ),
            )));
  }
}
