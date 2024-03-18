import 'package:openex_mobile/core/common/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static Storage? _instance;
  Storage._(this.preferences);

  factory Storage() {
    if (_instance == null) {
      throw 'Need call init Strorage first';
    }
    return _instance!;
  }

  static Future init() async {
    if (_instance != null) {
      throw 'Strorage had been inited';
    }
    _instance = Storage._(await SharedPreferences.getInstance());
  }

  SharedPreferences? preferences;
}

extension LanguageStorage on Storage {
  Future<String?> getLanguage() async {
    return preferences!.getString(StorageKey.LANGUAGE_KEY);
  }

  Future<bool> setLanguage(String languageCode) async {
    return await preferences!.setString(StorageKey.LANGUAGE_KEY, languageCode);
  }
}
