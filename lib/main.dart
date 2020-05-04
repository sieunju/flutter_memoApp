import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// Main App Start..
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '메모',
        theme: ThemeData(
          // App 대표 색상 44,102,235
          primaryColor: Color.fromRGBO(44, 102, 235, 1),
        ),
        home: Scaffold(
          body: Center(
            child: Container(
//                color: Color.fromRGBO(44, 102, 235, 1),
                padding: EdgeInsets.only(left: 19, right: 19),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/logo.png',
                        height: 100, fit: BoxFit.cover),
                    TextField(
                      decoration: InputDecoration.collapsed(hintText: 'id'),
                    ),
                    TextField(
                      decoration: InputDecoration.collapsed(hintText: 'pw'),
                    ),
                    MaterialButton(
                      child: Text('비로그인 시작'),
                      color: Color.fromRGBO(44, 102, 235, 1),
                      textColor: Color.fromRGBO(255, 255, 255, 1),
                      padding: EdgeInsets.only(top: 6,bottom: 6),
                      minWidth: 200,
                      height: 50,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      onPressed: (){
                        debugPrint('비로그인 시작 클릮');
                      },
                    )
                  ],
                )),
          ),
        ));
  }
}