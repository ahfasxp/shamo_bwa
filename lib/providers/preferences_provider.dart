import 'package:flutter/foundation.dart';
import 'package:shamo_bwa/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getUserToken();
  }

  // Shared Preference userToken
  late String _userToken;
  String get userToken => _userToken;

  void _getUserToken() async {
    _userToken = await preferencesHelper.getUserToken;
    notifyListeners();
  }

  void setUserToken(String token) {
    preferencesHelper.setUserToken(token);
    _getUserToken();
  }

  void removeUserToken() {
    preferencesHelper.removeUserToken();
  }
}
