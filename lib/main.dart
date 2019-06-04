import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_course/pages/product.dart';
import 'dart:io' show Platform;

import 'package:flutter_course/pages/products_admin.dart';
import 'package:flutter_course/pages/products.dart';

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
  final List<Map<String, dynamic>> _products = [];

  void _addProducts(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
//      home: AuthPage(),
      routes: {
        "/admin": (BuildContext context) =>
            ProductsAdminPage(_addProducts, _deleteProduct),
        '/': (BuildContext context) => ProductsPage(_products)
      },
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElements = settings.name.split('/');

        if (pathElements[0] != '') {
          return null;
        }

        if (pathElements[1] == 'product') {
          int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'], _products[index]['image']),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(_products));
      },
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
