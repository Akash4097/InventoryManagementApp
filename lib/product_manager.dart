import 'package:flutter/material.dart';
import 'package:flutter_course/product_controller.dart';
import './products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProducts;
  final Function deleteProduct;

  ProductManager(this.products, this.addProducts, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: ProductController(addProducts),
      ),
      Expanded(
        child: Products(products, deleteProduct: deleteProduct),
      )
    ]);
  }
}
