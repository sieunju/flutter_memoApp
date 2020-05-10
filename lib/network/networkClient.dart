import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../defines/prefsDefine.dart';
import 'dataModels/user.dart';
import 'networkDefine.dart';

/// Restful 방식의 Client Class.
class NetworkClient {
  final bool isRelease = true;

  http.Client client;

  Map<String, String> headerMap;

  // [s] Single Ton Class
  static final NetworkClient instance = NetworkClient.init();

  factory NetworkClient() {
    return instance;
  }

  NetworkClient.init() {
    headerMap = {
      CONTENT_KEY: CONTENT_VALUE,
      TYPE_KEY: TYPE_VALUE,
    };

    client = http.Client();

//    client.head(baseUrl, headers: headerMap);
  }

  // [e] Single Ton Class

  /// Build Type 에 따라서 http, https 처리.
  Uri getUrI(String path) {
    return (isRelease) ? Uri.https(BASE_HOST, path) : Uri.http(BASE_HOST, path);
  }

  /// [s] GET Type
  void loginId(BuildContext context, String id, String pw, Function function) async {
    final response = (await client.post(getUrI(API_SIGNIN),
        headers: headerMap, body: jsonEncode({'user_id': id, 'user_pw': pw})));

    if (response.statusCode == 200) {
      // 자동 로그인 상태값 세팅.
      SharedPreferences prefs = await SharedPreferences.getInstance();

      User user = User.fromJson(json.decode(response.body));
      print('Login Key ' + user.getLoginKey());
      prefs.setString(PREF_LOGIN_KEY, user.getLoginKey());

      // 헤더값 세팅.
      headerMap[LOGIN_KEY] = user.getLoginKey();

    } else {
      print('Network Error');
    }
  }

  /// [e] GET Type

}
