import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  // Shared Preference isLogin
  static const LOGIN = 'LOGIN';

  Future<bool> get isLogin async {
    final prefs = await sharedPreferences;
    return prefs.getBool(LOGIN) ?? false;
  }

  void setLogin(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(LOGIN, value);
  }

  void removeLogin() async {
    final prefs = await sharedPreferences;
    prefs.remove(LOGIN);
    prefs.remove(USER_EMAIL);
    prefs.remove(USER_PASSWORD);
  }

  // Shared Preference userEmail
  static const USER_EMAIL = 'USER_EMAIL';

  Future<String> get getUserEmail async {
    final prefs = await sharedPreferences;
    return prefs.getString(USER_EMAIL) ?? '';
  }

  void setUserEmail(String email) async {
    final prefs = await sharedPreferences;
    prefs.setString(USER_EMAIL, email);
  }

  // Shared Preference userPassword
  static const USER_PASSWORD = 'USER_PASSWORD';

  Future<String> get getUserPassword async {
    final prefs = await sharedPreferences;
    return prefs.getString(USER_PASSWORD) ?? '';
  }

  void setUserPassword(String password) async {
    final prefs = await sharedPreferences;
    prefs.setString(USER_PASSWORD, password);
  }
}
