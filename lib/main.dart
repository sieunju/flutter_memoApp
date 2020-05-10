import 'package:flutter/material.dart';
import 'package:memo/network/Api.dart';
import 'package:memo/network/dataModels/user.dart';
import 'package:memo/views/memoList.dart';
import 'defines/commonColor.dart';
import 'network/networkClient.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {

  @override
  State createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();

  var txtId = "";
  var txtPw = "";

  @override
  void initState() {
    super.initState();
    print('LoginState initState');

  }


  @override
  void dispose() {
    super.dispose();
    print('LoginState dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('로그인'),
        backgroundColor: blueColor,
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // 로고 및 id , pw 입력창
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  // 로고 이미지
                  Image.asset('images/logo.png',
                      height: 100, fit: BoxFit.cover),
                  // 아이디 입력창
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: TextField(
                      style: TextStyle(fontSize: 13, color: blueColor),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Id',
                      ),
                      controller: idController,
                      onChanged: (text) {
                        txtId = text;
                      },
                    ),
                  ),
                  // 비밀번호 입력창
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: 13, color: blueColor),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      controller: pwController,
                      onChanged: (text) {
                        txtPw = text;
                      },
                    ),
                  ),
                  // 로그인 버튼!
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: MaterialButton(
                      child: Text('로그인'),
                      color: blueColor,
                      textColor: whiteColor,
                      padding: EdgeInsets.only(top: 6, bottom: 6),
                      colorBrightness: Brightness.light,
                      height: 50,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        print('loginClick ' + txtId + "\tPw\t" + txtPw);

                      },
                    ),
                  )
                ],
              ),
            ),
            // 비로그인 버튼
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              width: double.infinity,
              child: MaterialButton(
                child: Text('비로그인으로 시작'),
                color: whiteColor,
                textColor: grayColor,
                padding: EdgeInsets.only(top: 6, bottom: 6),
                minWidth: 200,
                height: 50,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  print('비로그인 시작 클릮');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MemoListState()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}