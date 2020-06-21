import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double prince;
  bool isShoppingCart;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.prince,
    @required this.isShoppingCart = false,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get item {
    return {...item}; // retorna uma cópia de _items
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, valueCartItem) {
      total += valueCartItem.prince * valueCartItem.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (value) {
        return CartItem(
          id: value.id,
          title: value.title,
          quantity: value.quantity + 1,
          prince: value.prince,
        );
      });
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          title: product.title,
          prince: product.price,
          quantity: 1,
        ),
      );
    }

    
  }
  void removeItem(Product product) {
      _items.remove(product.id,);
  }
    void toggleShoppingCart(Product product) {
    product.isShoppingCart = !product.isShoppingCart;
    notifyListeners(); // notifica todos os interessados quando isFavorite mudar
  }

}
