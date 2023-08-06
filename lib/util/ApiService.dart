import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_diet_tips/model/UserModel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  

  Future<bool> login(String username, String password) async {
    await dotenv.load(fileName: ".env");
    try {
      var loginUrl = Uri.parse(dotenv.get('BASE_URL') + 'rest-auth/login/');
      print(username + " "  + password + " " + loginUrl.toString());
      final response = await http.post(
        loginUrl,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );
      
      if (response.statusCode == 200) {
        print(response.body);
        var jsonResponse = json.decode(response.body);
        saveUserInfo(jsonResponse);
        return true;
      }
      else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<void> saveUserInfo(Map<String, dynamic> jsonResponse) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', jsonResponse['key']);
    prefs.setString('username', jsonResponse['username']);
    prefs.setString('firstName', jsonResponse['firstName']);
    prefs.setString('lastName', jsonResponse['lastName']);
    prefs.setString('email', jsonResponse['email']);
  }

  Future<List<UserModel>?> getUsers() async {
    await dotenv.load(fileName: ".env");
    try {
      var url = Uri.parse(dotenv.get('BASE_URL') + 'test/');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}