import 'dart:math';
import 'package:api/services/constants.dart';
import 'package:http/http.dart' as http;
import 'package:api/models/user_models.dart';

class ApiServices {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.userEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        //statusCode == 200 means Sucess
        List<UserModel> _userModel = userModelFromJson(response.body);
        return _userModel;
      }
    } catch (e) {
      log(e.toString() as num);
    }
    return null;
  }
}
