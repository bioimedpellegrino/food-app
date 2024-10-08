import 'dart:developer';
import 'dart:convert';

import 'package:flutter_diet_tips/model/AdviceModel.dart';
import 'package:flutter_diet_tips/model/DailyDietModel.dart';
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

  Future<UserModel> getUser() async {
    UserModel user = UserModel.empty();
    try {
      var token = await PrefData.getAuthToken();
      var headers = {
        'Authorization': 'Token ' + token
      };
      var url = Uri.parse(ConstantData.apiUrl + "core/patient/info/");
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        user = userModelFromJson(response.body);
        return user;
      }
    } catch (e, stacktrace) {
      log("getUser Error: $e");
      log("StackTrace: $stacktrace");
    }
    return user;
  }

  Future<Map<String, dynamic>> postUserData(Map<String, dynamic> userInfo) async {
    Map<String, dynamic> apiResponse = {};
    try {
      var url = Uri.parse(ConstantData.apiUrl + "core/patient/info/");
      var token = await PrefData.getAuthToken();
      var headers = {
        'Authorization': 'Token ' + token
      };

      var response = await http.post(url, headers: headers, body: userInfo);
      if (response.statusCode == 200) {
        apiResponse = json.decode(response.body);
        return apiResponse;
      }
      else{
        return apiResponse;
      }
    } catch (e, stacktrace) {
      log("postLogWeight Error: $e");
      log("StackTrace: $stacktrace");
      return apiResponse;
    }
  }



  Future<List<AdviceModel>> getAdvices() async {
    List<AdviceModel> _model = [];
    try {
      var token = await PrefData.getAuthToken();
      var headers = {
        'Authorization': 'Token ' + token
      };
      var url = Uri.parse(ConstantData.apiUrl + 'core/advices/');
      var response = await http.get(url, headers: headers);
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

  Future<List<DailyDietModel>> getDailyDietList(String date) async {
    List<DailyDietModel> _model = [];
    try {
      var url = Uri.parse(ConstantData.apiUrl + 'core/food/diet/?date=' + date);
      var token = await PrefData.getAuthToken();
      var headers = {
        'Authorization': 'Token ' + token
      };

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        _model = dailyDietListFromJson(json.decode(response.body));
        return _model;
      }
      else{
        return _model;
      }
    } catch (e, stacktrace) {
      log("getDailyDiet Error: $e");
      log("StackTrace: $stacktrace");
      return _model;
    }
  }

  Future<Map<String, dynamic>> getDailyDiet(String date) async {
    Map<String, dynamic> _model = {};
    try {
      var url = Uri.parse(ConstantData.apiUrl + "core/food/diet/?date=$date");
      var token = await PrefData.getAuthToken();
      var headers = {
        'Authorization': 'Token ' + token
      };

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        _model = json.decode(response.body);
        return _model;
      }
      else{
        return _model;
      }
    } catch (e, stacktrace) {
      log("getDailyDiet Error: $e");
      log("StackTrace: $stacktrace");
      return _model;
    }
  }

  Future<Map<String, dynamic>> getMicronutrients(int id) async {
    Map<String, dynamic> apiResponse = {};
    try {
      var url = Uri.parse(ConstantData.apiUrl + "core/food/diet/meal_micronutrients/$id/");
      var token = await PrefData.getAuthToken();
      var headers = {
        'Authorization': 'Token ' + token
      };

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        apiResponse = json.decode(response.body);
        return apiResponse;
      }
      else{
        return apiResponse;
      }
    } catch (e, stacktrace) {
      log("getDailyDiet Error: $e");
      log("StackTrace: $stacktrace");
      return apiResponse;
    }
  }


  Future<Map<String, dynamic>> postLogWeight(String logDate, String weight) async {
    Map<String, dynamic> apiResponse = {};
    try {
      var url = Uri.parse(ConstantData.apiUrl + "core/food/log_weight/");
      var token = await PrefData.getAuthToken();
      var headers = {
        'Authorization': 'Token ' + token
      };

      var payload = {
        "entry_date": logDate,
        "weight": weight
      };

      var response = await http.post(url, headers: headers, body: payload);
      if (response.statusCode == 200) {
        apiResponse = json.decode(response.body);
        return apiResponse;
      }
      else{
        return apiResponse;
      }
    } catch (e, stacktrace) {
      log("postLogWeight Error: $e");
      log("StackTrace: $stacktrace");
      return apiResponse;
    }
  }


  Future<Map<String,dynamic>> getLogWeightChart() async{
    Map<String,dynamic> apiResponse = {};
    try {
      var url = Uri.parse(ConstantData.apiUrl + "core/food/get_log_weight_chart/");
      var token = await PrefData.getAuthToken();
      var headers = {
        'Authorization': 'Token ' + token
      };

      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        apiResponse = json.decode(response.body);
        return apiResponse;
      }
      else{
        return apiResponse;
      }
    } catch (e, stacktrace) {
      log("getLogWeightChart Error: $e");
      log("StackTrace: $stacktrace");
      return apiResponse;
    }
  }

}