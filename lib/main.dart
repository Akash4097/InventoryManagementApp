import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

void main() {
  if (Platform.isIOS) {
    runApp(MyIosApp());
  } else {
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("EasyList"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text("Add Product"),
                onPressed: () {},
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/food.jpg'),
                  ),
                  Text("Food paradise")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyIosApp extends StatelessWidget {
  build(context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
          child: Center(
        child: CupertinoButton(
          child: Text("Click me!"),
        ),
      )),
    );
  }
}
