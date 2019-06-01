import 'package:flutter/material.dart';

class ProductController extends StatelessWidget {
  final Function addProduct;

  ProductController(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Text("Add Product"),
      onPressed: () {
        addProduct({'title': 'Chocolate', 'image': 'assets/food.jpg'});
      },
    );
  }
}
