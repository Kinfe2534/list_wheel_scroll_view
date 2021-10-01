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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    PageController controller =
        PageController(viewportFraction: 1.0, initialPage: 2);
    List<Widget> banners = <Widget>[];
    List<Widget> row = <Widget>[];

    for (int x = 0; x <= 9; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10),
        child: CircleAvatar(
          child: Container(
            width: screenWidth / 5,
            height: screenHeight * 0.2,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircleAvatar(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        )
                      ])),
                ),
                CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.white],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            x.toString(),
                            style:
                                TextStyle(fontSize: 50.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
      banners.add(bannerView);
    }
    for (int i = 0; i < 5; i++) {
      var oneCol = Container(
        width: screenWidth / 5,
        height: screenWidth / 5,
        child: PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: banners,
        ),
      );
      row.add(oneCol);
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: row,
      ),
    );
  }
}
