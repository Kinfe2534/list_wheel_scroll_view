// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DigitListWheelScrollView(),
    );
  }
}

class DigitListWheelScrollView extends StatelessWidget {
  const DigitListWheelScrollView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i <= 9; i++) {
      var scrollWheel = Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 4.0,
                          spreadRadius: 3.0)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.blue])),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    i.toString(),
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      );
      list.add(scrollWheel);
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.3,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListWheelScrollView(
          diameterRatio: 1,
          physics: FixedExtentScrollPhysics(),
          onSelectedItemChanged: (index) {
            Fluttertoast.showToast(
                msg: "Selected Item:${index}",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                //  timeInSecForIos: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white);
          },
          itemExtent: 15,
          children: list,
        ),
      ),
    );
  }
}
