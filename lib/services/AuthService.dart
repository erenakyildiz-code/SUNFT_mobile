import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/User.dart';
import '../variables.dart';

var client = http.Client();

class AuthService {

  Future<String> _getRefreshToken(String username, String password) async {
    final JWTRequest = http.Request("POST", Uri.parse("$AuthPath/jwt/create/"));
    JWTRequest.headers.addAll(<String, String>{
      "Accept": "application/json",
      "Content-Type": "application/json",
    });
    JWTRequest.body = '{"username": "$username" , "password": "$password"}';
    final JWTResponse = await JWTRequest.send();
    if (JWTResponse.statusCode == 200) {
      final refreshToken = json.decode(await JWTResponse.stream.bytesToString())["refresh"];
      return refreshToken;
    }
    return "";
  }

  Future<String> _getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final JWTRequest = http.Request("POST", Uri.parse("$AuthPath/jwt/refresh/"));
    JWTRequest.headers.addAll(<String, String>{
      "Accept": "application/json",
      "Content-Type": "application/json",
    });
    JWTRequest.body = '{"refresh": "${prefs.getString("refreshToken")}"}';
    final JWTResponse = await JWTRequest.send();
    final accessToken = json.decode(await JWTResponse.stream.bytesToString())["access"];
    return accessToken;
  }

  Future<User?> getUserInfo() async {
    String accessToken = await _getAccessToken();
    final userInfoRequest = http.Request("GET", Uri.parse("$AuthPath/users/me/"));
    userInfoRequest.headers.addAll(<String, String>{
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "JWT $accessToken"
    });
    final userInfoResponse = await userInfoRequest.send();
    final userInfoAsJson = json.decode(await userInfoResponse.stream.bytesToString());
    final user = User.fromJson(userInfoAsJson);
    return user;
  }

  Future<User?> login(String username, String password) async {
    var prefs = await SharedPreferences.getInstance();

      String refreshToken = await _getRefreshToken(username, password);
      if (refreshToken.isEmpty) {
        return null;
      }
      prefs.setString("refreshToken", refreshToken);

    return await getUserInfo();
  }


}





