import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/auth/models/user_model.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper apiAuthHelper = AuthHelper._();
  SharedPreferences prefs;
  static const URL = '192.168.90.157:81';

  static const headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
  Future<SharedPreferences> instializeSp() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
      return prefs;
    } else {
      return prefs;
    }
  }

  // ignore: non_constant_identifier_names
  Future<UserModel> Get(String email) async {
    final response =
        await http.get(Uri.http(URL, '/api/users/$email'), headers: headers);
    if (response.statusCode == 200 && jsonDecode(response.body).isNotEmpty) {
      return UserModel.fromJson(jsonDecode(response.body)[0]);
    } else {
      throw Exception("Contact loading failed");
    }
  }

  Future<String> userlogin(String email) async {
    try {
      email = 1.toString();
      prefs = await instializeSp();
      final response =
          await http.get(Uri.http(URL, '/api/users/$email'), headers: headers);
      if (response.statusCode == 200 && jsonDecode(response.body).isNotEmpty) {
        prefs.setString('email',
            UserModel.fromJson(jsonDecode(response.body)[0]).userEmail);
        prefs.setString('userName',
            UserModel.fromJson(jsonDecode(response.body)[0]).userName);
        prefs.setString('password',
            UserModel.fromJson(jsonDecode(response.body)[0]).password);
        prefs.setBool('isLogged', true);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> checkUserLogin() async {
    try {
      prefs = await instializeSp();
      bool isLoggedUser = prefs.getBool('isLogged');
      return isLoggedUser;
    } catch (error) {
      print(error);
    }
  }
}
