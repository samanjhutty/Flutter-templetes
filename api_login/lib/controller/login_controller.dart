import 'package:api_login/api-services/api_services.dart';
import 'package:api_login/api-services/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LoginAuth with ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  Box box = Hive.box('API-LoginBox');
  bool? login;
  UserModel? userdata;

  Future<void> logout() async {
    box.put('user-login', false);
    notifyListeners();
    Get.rawSnackbar(message: 'Logged out Sucessfully');
  }

  void refresh() {
    userdata = ApiServices().userdata;
    login = box.get('user-login', defaultValue: false);
    notifyListeners();
  }

  Future<void> createAccount() async {
    try {
      if (confirmPassword.text == password.text) {
        await ApiServices().postUser(
            name: name.text.trim(),
            email: emailAddress.text.trim(),
            password: password.text.trim());
        notifyListeners();
        Get.until(ModalRoute.withName('/'));
      } else {
        Get.rawSnackbar(message: "Password doesn't match");
      }
    } catch (e) {
      Get.rawSnackbar(message: e.toString());
    }
  }

  Future<void> signIn() async {
    try {
      await ApiServices().getUser(
          email: emailAddress.text.trim(), password: password.text.trim());
      notifyListeners();
      Get.until(ModalRoute.withName('/'));
    } catch (e) {
      Get.rawSnackbar(message: e.toString());
    }
  }
}
