import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/providers/product.dart';

// Tem o objetivo de encapsular a lista das Fazendas
// ChangeNotifier = notifica todos os interessandos quando haver mudança
class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  //[..._items] = retorna uma cópia de items para não aletrar o valor original = melhor prática
  List<Product> get items => [..._items];

  List<Product> get favotiteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  int get itemsCount {
    return _items.length;
  }

  // se alguem chama o metódo para add
  void addProduct(Product newProduct) {
    _items.add(Product(
      id: Random().nextDouble().toString(),
      title: newProduct.title,
      description: newProduct.description,
      price: newProduct.price,
      imageUrl: newProduct.imageUrl,
    ));
    //notifyListeners = vai notificar todos os interessados quando o evento for chamado
    notifyListeners();
  }

  void updateProduct(Product product) {
    if (product == null || product.id == null) {
      return;
    }

    final index = _items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    final index = _items.indexWhere((prod) => prod.id == id);
    if (index >= 0) {
      _items.removeWhere((prod) => prod.id == id);
      notifyListeners();
    }
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

}
