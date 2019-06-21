import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_course/pages/auth.dart';
import 'package:flutter_course/pages/product.dart';
import 'dart:io' show Platform;

import 'package:flutter_course/pages/products_admin.dart';
import 'package:flutter_course/pages/products.dart';
import 'package:flutter_course/models/product.dart';
import 'package:flutter_course/scoped_models/products.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  if (Platform.isIOS) {
    runApp(MyIosApp());
  } else {
    runApp(MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(context) {
    return ScopedModel(
      model: ProductsModel(),
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepOrange, buttonColor: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
//      home: AuthPage(),
        routes: {
          "/": (BuildContext context) => AuthPage(),
          "/admin": (BuildContext context) => ProductsAdminPage(),
          '/products': (BuildContext context) => ProductsPage()
        },
        onGenerateRoute: (RouteSettings settings) {
          List<String> pathElements = settings.name.split('/');

          if (pathElements[0] != '') {
            return null;
          }

          if (pathElements[1] == 'product') {
            int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) =>
                  ProductPage(index),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings setting) {
          return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage());
        },
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
