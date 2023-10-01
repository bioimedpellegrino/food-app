import 'dart:developer';
import 'dart:convert';

import 'package:flutter_diet_tips/model/AdviceModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_diet_tips/model/UserModel.dart';
import 'package:flutter_diet_tips/util/PrefData.dart';
import 'package:flutter_diet_tips/util/ConstantData.dart';

class ApiService {
  

  Future<bool> login(String username, String password) async {
    try {
      var loginUrl = Uri.parse(ConstantData.apiUrl + 'rest-auth/login/');
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
    PrefData.setAuthToken(jsonResponse['key']);
    PrefData.setFirstName(jsonResponse['firstName']);
    PrefData.setLastName(jsonResponse['lastName']);
    PrefData.setUsername(jsonResponse['username']);
    PrefData.setEmail(jsonResponse['email']);
  }

  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ConstantData.apiUrl + 'test/');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List<AdviceModel>> getAdvices() async {
    List<AdviceModel> _model = [];
    try {
      var url = Uri.parse(ConstantData.apiUrl + 'core/advices/');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        _model = adviceModelFromJson(response.body);
        return _model;
      }
      else{
        return _model;
      }
    } catch (e) {
      log(e.toString());
      return _model;
    }
  }
}