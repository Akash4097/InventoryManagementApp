import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/products/product_card.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductList() {
    Widget productItems;
    if (products.length > 0) {
      productItems = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      productItems = Center(child: Text("No products found, please add some"));
    }

    return productItems;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
