import 'package:flutter/material.dart';
import 'commonColor.dart';
import 'networkClient.dart';

void main() => runApp(MyApp());

/// Main App Start..
class MyApp extends StatefulWidget {
  final String title;

  MyApp({Key key, this.title}) : super(key: key);

  @override
  MyStatefulWidget createState() => MyStatefulWidget();
}

class MyStatefulWidget extends State<MyApp> {

  final idController = TextEditingController();
  final pwController = TextEditingController();
  var txtId = "";
  var txtPw = "";

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Debug Label Gone
        debugShowCheckedModeBanner: false,
        title: '메모',
        theme: ThemeData(
          // App 대표 색상 44,102,235
          primaryColor: blueColor,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // 로고 및 id , pw 입력창
                Container(
                  margin: EdgeInsets.only(top: 130, left: 20, right: 20),
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
                          onChanged: (text){
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
                          onChanged: (text){
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

                            NetworkClient.instance.loginId(context,txtId, txtPw);
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
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    pwController.dispose();
    print('dispose');
  }
}

/// Main App Start..
//class MyApp extends StatelessWidget {
//
//  final idController = TextEditingController();
//
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        // Debug Label Gone
//        debugShowCheckedModeBanner: false,
//        title: '메모',
//        theme: ThemeData(
//          // App 대표 색상 44,102,235
//          primaryColor: blueColor,
//        ),
//        home: Scaffold(
//          body: Center(
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                // 로고 및 id , pw 입력창
//                Container(
//                  margin: EdgeInsets.only(left: 10, right: 10),
//                  width: double.infinity,
//                  child: Column(
//                    children: <Widget>[
//                      // 로고 이미지
//                      Image.asset('images/logo.png',
//                          height: 100, fit: BoxFit.cover),
//                      // 아이디 입력창
//                      Container(
//                        margin: EdgeInsets.only(top: 10),
//                        width: double.infinity,
//                        child: TextField(
//                          style: TextStyle(fontSize: 11, color: blueColor),
//                          decoration: InputDecoration(
//                            border: OutlineInputBorder(),
//                            labelText: 'Id',
//                          ),
//                        ),
//                      ),
//                      // 비밀번호 입려창
//                      Container(
//                        margin: EdgeInsets.only(top: 10),
//                        width: double.infinity,
//                        child: TextField(
//                          obscureText: true,
//                          style: TextStyle(fontSize: 11, color: blueColor),
//                          decoration: InputDecoration(
//                            border: OutlineInputBorder(),
//                            labelText: 'Password',
//                          ),
//                        ),
//                      ),
//                      Container(
//                        margin: EdgeInsets.only(top: 20),
//                        width: double.infinity,
//                        child: MaterialButton(
//                          child: Text('로그인'),
//                          color: blueColor,
//                          textColor: Color.fromRGBO(255, 255, 255, 1),
//                          padding: EdgeInsets.only(top: 6, bottom: 6),
//                          colorBrightness: Brightness.light,
//                          height: 50,
//                          elevation: 3,
//                          shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(10)),
//                          onPressed: () {
//                            debugPrint('로그인 버튼 클릭!');
//                          },
//                        ),
//                      )
//                    ],
//                  ),
//                ),
//                // 비로그인 버튼
//                Container(
//                  margin: EdgeInsets.only(top: 50, left: 10, right: 10),
//                  width: double.infinity,
//                  child: MaterialButton(
//                    child: Text('비로그인으로 시작'),
//                    color: Color.fromRGBO(44, 102, 235, 1),
//                    textColor: Color.fromRGBO(255, 255, 255, 1),
//                    padding: EdgeInsets.only(top: 6, bottom: 6),
//                    minWidth: 200,
//                    height: 50,
//                    elevation: 3,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(10)),
//                    onPressed: () {
//                      debugPrint('비로그인 시작 클릮');
//                    },
//                  ),
//                )
//              ],
//            ),
//          ),
//        ));
//  }
//
//}
