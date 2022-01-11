import 'package:flutter/foundation.dart';
import 'package:shamo_bwa/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getLogin();
    _getUserEmail();
    _getUserPassword();
  }

  // Shared Preference isLogin
  bool _isLogin = false;
  bool get isLogin => _isLogin;

  void _getLogin() async {
    _isLogin = await preferencesHelper.isLogin;
    notifyListeners();
  }

  void loginUser(bool value) {
    preferencesHelper.setLogin(value);
    _getLogin();
  }

  void removeLoginUser() {
    preferencesHelper.removeLogin();
  }

  // Shared Preference userEmail
  late String _userEmail;
  String get userEmail => _userEmail;

  void _getUserEmail() async {
    _userEmail = await preferencesHelper.getUserEmail;
    notifyListeners();
  }

  void setUserEmail(String email) {
    preferencesHelper.setUserEmail(email);
    _getUserEmail();
  }

  // Shared Preference userPassword
  late String _userPassword;
  String get userPassword => _userPassword;

  void _getUserPassword() async {
    _userPassword = await preferencesHelper.getUserPassword;
    notifyListeners();
  }

  void setUserPassword(String password) {
    preferencesHelper.setUserPassword(password);
    _getUserPassword();
  }
}
