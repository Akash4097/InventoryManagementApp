import 'package:flutter/material.dart';
import 'package:flutter_course/models/product.dart';
import 'package:flutter_course/widgets/products/product_card.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_course/scoped_models/products.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
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
    /*
    Whenever their is change in the model, this method will be called
     */
    return ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget widget, ProductsModel model) {
      return _buildProductList(model.product);
    });
  }
}
