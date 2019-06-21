import 'package:flutter/material.dart';
import 'package:flutter_course/models/product.dart';
import 'package:flutter_course/scoped_models/products.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    "title": null,
    "description": null,
    "price": null,
    "image": "assets/food.jpg"
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Title"),
      onSaved: (String value) {
        _formData["title"] = value;
      },
      initialValue: product == null ? "" : product.title,
      validator: (String value) {
        if (value.isEmpty || value.length <= 5) {
          return "Title is required and size should be 5+ character";
        }
      },
    );
  }

  Widget _buildDescriptionTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Description"),
      maxLines: 4,
      onSaved: (String value) {
        _formData["description"] = value;
      },
      initialValue: product == null ? "" : product.description,
      validator: (String value) {
        if (value.isEmpty || value.length <= 10) {
          return "Description is required and size should be 10+ character";
        }
      },
    );
  }

  Widget _buildPriceTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(labelText: "Product Price"),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        _formData["price"] = double.parse(value);
      },
      initialValue: product == null ? "" : product.price.toString(),
      validator: (String value) {
        if (value.isEmpty || double.tryParse(value) == null) {
          return "Price is required and it should be number";
        }
      },
    );
  }

  void _submitForm(Function addProduct, Function updateProduct,
      [selectedProductIndex]) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    if (selectedProductIndex == null) {
      addProduct(Product(
          title: _formData["title"],
          description: _formData["description"],
          price: _formData["price"],
          image: _formData["image"]));
    } else {
      updateProduct(Product(
          title: _formData["title"],
          description: _formData["description"],
          price: _formData["price"],
          image: _formData["image"]));
    }
    Navigator.pushReplacementNamed(context, "/products");
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return RaisedButton(
          child: Text("Save"),
          textColor: Colors.white,
          onPressed: () => _submitForm(model.addProducts, model.updateProduct,
              model.selectedProductIndex),
        );
      },
    );
  }

  Widget _buildPageContent(BuildContext context, Product product) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(product),
              _buildDescriptionTextField(product),
              _buildPriceTextField(product),
              SizedBox(
                height: 10.0,
              ),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        final Widget pageContent =
            _buildPageContent(context, model.selectedProduct);
        return model.selectedProductIndex == null
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text("Edit Product"),
                ),
                body: pageContent,
              );
      },
    );
  }
}
