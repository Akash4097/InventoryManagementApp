import 'package:flutter_course/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

mixin ProductsModel on Model {
  bool _showFavorite = false;
  List<Product> _products = [];
  int _selectedProductIndex;

  List<Product> get product {
    return List.from(_products); // this will return new list with same items
  }

  List<Product> get displayProducts {
    if (_showFavorite) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products); // this will return new list with same items
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return _products[selectedProductIndex];
  }

  bool get displayFavoriteOnly {
    return _showFavorite;
  }

  void addProducts(Product product) {
    _products.add(product);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void updateProduct(Product product) {
    _products[selectedProductIndex] = product;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
    notifyListeners();
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = selectedProduct.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        isFavorite: newFavoriteStatus);

    _products[selectedProductIndex] = updatedProduct;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorite = !_showFavorite;
    notifyListeners();
    _selectedProductIndex = null;
  }
}
