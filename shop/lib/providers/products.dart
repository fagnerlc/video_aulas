import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items =>[..._items];
  List<Product> get favotiteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  // inicio gerenciamento de forma global
  //bool _showFavoriteOnly = false;
  //List<Product> get items {
  //  if (_showFavoriteOnly) {
  //    return _items.where((element) => element.isFavorite).toList();
  //  } else {
  //    return [..._items];// [] nesse caso gera uma cópia da lista _items
  //  } 
  //}

  //void showFavoriteOnly(){
  //  _showFavoriteOnly = true;
  //  notifyListeners();
  //}

  //  void showAll(){
  //  _showFavoriteOnly = false;
  //  notifyListeners();
  //}
  // fim gerenciamento de forma global

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
