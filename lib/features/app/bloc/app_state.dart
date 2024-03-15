part of 'app_cubit.dart';

class AppState {
  final Language language;

  AppState({required this.language});

  AppState.init()
      : language = Language(
            currentLang: LanguageCode.JA, previousLang: LanguageCode.JA);
}
