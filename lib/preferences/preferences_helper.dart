import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  // Shared Preference Token
  static const TOKEN = 'TOKEN';

  Future<String> get getUserToken async {
    final prefs = await sharedPreferences;
    return prefs.getString(TOKEN) ?? '';
  }

  void setUserToken(String token) async {
    final prefs = await sharedPreferences;
    prefs.setString(TOKEN, token);
  }

  void removeUserToken() async {
    final prefs = await sharedPreferences;
    prefs.remove(TOKEN);
  }
}
