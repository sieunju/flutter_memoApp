import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:memo/commonColor.dart';
import 'dart:async';
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
  Uri getUrI(String path){
    return (isRelease) ? Uri.https(BASE_HOST,path) : Uri.http(BASE_HOST,path);
  }

  /// [s] GET Type
  void loginId(BuildContext context,String id, String pw) async {
    final response = await client.post(getUrI(API_SIGNIN),
      headers: headerMap,
      body: jsonEncode({
        'user_id' : id,
        'user_pw' : pw
      })
    );

    if(response.statusCode == 200){
      Fluttertoast.showToast(
          msg: "Login Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: blueColor,
          textColor: whiteColor,
          fontSize: 13.0
      );
      print('NetWork LoginId Success' + response.body.toString());
    } else {
      Fluttertoast.showToast(
          msg: "Login Fail",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: blueColor,
          textColor: whiteColor,
          fontSize: 13.0
      );
      print('Network Error');
    }
  }

  /// [e] GET Type


}
