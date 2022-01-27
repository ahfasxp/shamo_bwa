import 'package:flutter/foundation.dart';
import 'package:shamo_bwa/models/user_model.dart';
import 'package:shamo_bwa/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  // set user(UserModel user) {
  //   _user = user;
  //   notifyListeners();
  // }

  Future<bool> register(
      {required String name,
      required String username,
      required String email,
      required String password}) async {
    try {
      UserModel user = await AuthService().register(
          name: name, username: username, email: email, password: password);

      _user = user;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      UserModel user =
          await AuthService().login(email: email, password: password);

      _user = user;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout({required String token}) async {
    try {
      await AuthService().logout(token: token);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> isLogin({required String token}) async {
    try {
      UserModel user = await AuthService().getUser(token: token);

      _user = user;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
