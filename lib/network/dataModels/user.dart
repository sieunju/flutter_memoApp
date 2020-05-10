import 'dart:convert';

import 'baseDataModel.dart';

class User {
  final String user_id;
  final String user_pw;
  final String loginKey;

  User({this.user_id,this.user_pw,this.loginKey});

  getLoginKey() {
    return loginKey;
  }

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      user_id: json['user_id'],
      user_pw : json['user_pw'],
      loginKey : json['loginKey']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'user_id' : user_id,
      'user_pw' : user_pw
    };
  }
}
