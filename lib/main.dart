import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

main() {
  if (Platform.isIOS) {
    runApp(myIosApp());
  } else {
    runApp(myApp());
  }
}

class myApp extends StatelessWidget {
  build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("EasyList"),
        ),
      ),
    );
  }
}

class myIosApp extends StatelessWidget {
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
