import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openex_mobile/blocs/language/language_cubit.dart';
import 'package:openex_mobile/common/constants.dart';
import 'package:openex_mobile/config/app_router.dart';
import 'package:openex_mobile/config/end_points.dart';
import 'package:openex_mobile/data/repository/auth_repository.dart';
import 'package:openex_mobile/resources/colors.dart';
import 'package:openex_mobile/resources/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:openex_mobile/utils/log/log.dart';

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
      context.read<LanguageCubit>().changeLanguage(languageCode);
    }

    void testCallAPI() async {
      Log.d("test call API");
      final AuthRepository authRepository = AuthRepository();

      final resp =
          await authRepository.login(Endpoints.LOGIN, "kminchelle", "0lelplR");

      Log.d("testCallAPI: ${resp?.email}");
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
                        child: const Text("Test Call API"))
                  ],
                ),
              ),
            )));
  }
}
