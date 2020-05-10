
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../defines/prefsDefine.dart';
import 'dataModels/user.dart';
import 'networkClient.dart';
import 'networkDefine.dart';

class APIService {

  Future<User> callLogin(String id,String pw) async {
    final response = (await NetworkClient.instance.client.post(
        NetworkClient.instance.getUrI(API_SIGNIN),
        body: jsonEncode({'user_id': id, 'user_pw': pw})));

    if(response.statusCode == 200){
      SharedPreferences prefs = await SharedPreferences.getInstance();

      User user = User.fromJson(json.decode(response.body));
      print('Login Key ' + user.getLoginKey());
      prefs.setString(PREF_LOGIN_KEY, user.getLoginKey());

      // 헤더값 세팅.
      NetworkClient.instance.headerMap[LOGIN_KEY] = user.getLoginKey();
      print("CallLogin Success");
      return user;
    }
    // 에러인경우.
    else {
      print("CallLogin Fail");
      return null;
    }
  }
}