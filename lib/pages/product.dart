import 'package:flutter/material.dart';
import 'package:flutter_course/models/product.dart';
import 'package:flutter_course/scoped_models/main.dart';
import 'package:flutter_course/widgets/products/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  Widget _buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Union Square, San Francisco",
          style: TextStyle(fontFamily: "Oswald", color: Colors.grey),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              '|',
              style: TextStyle(color: Colors.grey),
            )),
        Text(
          '\$' + price.toString(),
          style: TextStyle(fontFamily: "Oswald", color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("Back button pressed");
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          final Product product = model.product[productIndex];
          return Scaffold(
            appBar: AppBar(
              title: Text(product.title),
            ),
            body: ListView(
//          crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage(product.image),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: TitleDefault(product.title),
                ),
                _buildAddressPriceRow(product.price),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    product.description,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
