import 'package:bloc/bloc.dart';
import 'package:openex_mobile/core/common/app_constants.dart';
import 'package:openex_mobile/core/common/app_enums.dart';
import 'package:openex_mobile/data/models/language_model.dart';
import 'package:openex_mobile/utils/storage/storage.dart';
import 'package:openex_mobile/utils/toast_manager/toast_manager.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.init());

  Future<void> initApp() async {
    try {
      await Storage.init();
      await loadLanguage();
    } catch (err) {
      ToastManager.showNotificationToast(ToastType.Error, err.toString());
    }
  }

  void changeLanguage(String languageCode) async {
    if (languageCode == state.language.currentLang) {
      return;
    }

    final status = await Storage().setLanguage(languageCode);
    if (status) {
      emit(AppState(
          language: Language(
              currentLang: languageCode,
              previousLang: state.language.currentLang)));
    }
  }

  Future<void> loadLanguage() async {
    final languageCode = await Storage().getLanguage() ?? LanguageCode.EN;
    emit(AppState(
        language: Language(
            currentLang: languageCode,
            previousLang: state.language.currentLang)));
  }
}
