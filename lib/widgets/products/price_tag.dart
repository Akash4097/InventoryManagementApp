import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final String price;
  final rupees = '\u20b9';

  PriceTag(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 6.0),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        '$rupees $price',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
