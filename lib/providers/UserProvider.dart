import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import "../services/AuthService.dart";
import "../models/User.dart";

class UserProvider with ChangeNotifier {
  User? _user;
  bool _loading = false;

  User? get user => _user;
  bool get loading => _loading;

  Future<bool> login(String username, String password) async {
    _loading = true;
    notifyListeners();
    _user = await AuthService().login(username, password);
    _loading = false;
    notifyListeners();
    return _user != null;
  }

  Future<bool> logout() async {
    _user = null;
    _loading = true;
    notifyListeners();
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("refreshToken");
    _loading = false;
    notifyListeners();
    return _user == null;
  }

}