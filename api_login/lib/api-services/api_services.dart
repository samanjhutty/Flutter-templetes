import 'dart:convert';
import 'package:api_login/api-services/constants.dart';
import 'package:api_login/api-services/usermodel.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Box box = Hive.box('API-LoginBox');
  UserModel? userdata;

  Future<void> postUser(
      {required String name,
      required String email,
      required String password}) async {
    var url = Uri.parse(ApiConstants.baseURL + ApiConstants.registration);
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email, 'password': password}));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['code'] == 0) {
        box.putAll({
          'user-tokken': json['data']['Tokken'].toString(),
          'user-login': true
        });
        userdata = UserModel.fromJson(json['data']);
        Get.rawSnackbar(message: 'User created sucessfully');
      } else {
        throw json['message'].toString();
      }
    } else {
      throw 'Something went wrong, try again';
    }
  }

  Future<void> getUser(
      {required String email, required String password}) async {
    var url = Uri.parse(ApiConstants.baseURL + ApiConstants.login);
    var response = await http.post(url,
        headers: {
          'Authorization': 'Bearer ${box.get('user-tokken')}',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({'email': email, 'password': password}));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['code'] == 0) {
        box.putAll({
          'user-tokken': json['data']['Tokken'].toString(),
          'user-login': true
        });
        userdata = UserModel.fromJson(json['data']);
        Get.rawSnackbar(message: 'Login sucessful');
      } else {
        throw json['message'].toString();
      }
    } else {
      throw 'Something went wrong, try again';
    }
  }
}
