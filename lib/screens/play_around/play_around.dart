import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openex_mobile/blocs/language/language_cubit.dart';
import 'package:openex_mobile/common/constants.dart';
import 'package:openex_mobile/config/app_router.dart';
import 'package:openex_mobile/resources/colors.dart';
import 'package:openex_mobile/resources/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                        child: const Text("Change app language to Japan"))
                  ],
                ),
              ),
            )));
  }
}
