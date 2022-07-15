import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import "../services/AuthService.dart";
import "../models/User.dart";

class UserProvider with ChangeNotifier {
  User? _user;
  User? get user => _user;

  Future<void> login(String username, String password) async {
    _user = await AuthService().login(username, password);
    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("refreshToken");
    notifyListeners();
  }



}