import 'package:bloc/bloc.dart';
import 'package:openex_mobile/core/common/app_constants.dart';
import 'package:openex_mobile/data/models/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.init());

  void changeLanguage(String languageCode) async {
    if (languageCode == state.language.currentLang) {
      return;
    }

    final status = await _changeLanguage(languageCode);
    if (status) {
      emit(AppState(
          language: Language(
              currentLang: languageCode,
              previousLang: state.language.currentLang)));
    }
  }

  Future<void> loadLanguage() async {
    final languageCode = await _loadLanguage() ?? LanguageCode.EN;
    emit(AppState(
        language: Language(
            currentLang: languageCode,
            previousLang: state.language.currentLang)));
  }

  Future<String?> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(StorageKey.LANGUAGE_KEY);
  }

  Future<bool> _changeLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(StorageKey.LANGUAGE_KEY, languageCode);
  }
}
