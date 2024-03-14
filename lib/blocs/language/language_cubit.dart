import 'package:bloc/bloc.dart';
import 'package:openex_mobile/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit()
      : super(const LanguageState(
            currentLang: LanguageCode.EN, previousLang: LanguageCode.EN));

  void changeLanguage(String languageCode) async {
    if (languageCode == state.currentLang) {
      return;
    }

    final status = await _changeLanguage(languageCode);

    if (status) {
      emit(LanguageState(
          currentLang: languageCode, previousLang: state.currentLang));
    }
  }

  Future<void> loadLanguage() async {
    final languageCode = await _loadLanguage();
    emit(LanguageState(
        currentLang: languageCode, previousLang: state.currentLang));
  }

  Future<String> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('language') ?? 'en';
  }

  Future<bool> _changeLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('language', languageCode);
  }
}
