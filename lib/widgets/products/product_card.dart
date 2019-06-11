import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/products/address_tag.dart';
import 'package:flutter_course/widgets/products/price_tag.dart';
import 'package:flutter_course/widgets/products/ui_elements/title_default.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product['title']),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(product["price"].toString())
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + productIndex.toString()),
        ),
        IconButton(
          icon: Icon(
            Icons.favorite_border,
          ),
          color: Colors.red,
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage(product['image']),
          ),
          _buildTitlePriceRow(),
          AddressTag("Union Square, San Francisco"),
          _buildActionButton(context)
        ],
      ),
    );
  }
}