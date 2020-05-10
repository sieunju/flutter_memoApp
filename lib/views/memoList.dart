import 'package:flutter/material.dart';
import '../defines/commonColor.dart';

class MemoListState extends StatefulWidget {

  final String title;

  MemoListState({Key key,this.title}) : super(key: key);

  @override
  MemoListPage createState() => MemoListPage();
}

class MemoListPage extends State<MemoListState> {

  @override
  void initState() {
    super.initState();
    print('MemoListPage initState');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Debug Label Gone
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('메모 리스트'),
          backgroundColor: blueColor,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('테스트')
            ],
          ),

        ),
      )

    );
  }

  @override
  void dispose() {
    super.dispose();
    print('MemoListPage dispose');
  }


}