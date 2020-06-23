import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:shop/providers/product.dart';

class CartItem {
  final String id;
  final String productId;
  final String title;
  int quantity;
  final double price;
  //final bool isShoppingCart;

  CartItem({
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.quantity,
    @required this.price,
    //@required this.isShoppingCart = false,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items}; // retorna uma cópia de _items
  }

  int get itemsCount {
    return _items.length;
  }

  
  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, valueCartItem) {
      total += valueCartItem.price * valueCartItem.quantity;
      notifyListeners();
    });
    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(product.id, (value) {
        return CartItem(
          id: value.id,
          productId: product.id,
          title: value.title,
          quantity: value.quantity + 1,
          price: value.price,
        );
      });
    } else {
      _items.putIfAbsent(
        product.id,
        () => CartItem(
          id: Random().nextDouble().toString(),
          productId: product.id,
          title: product.title,
          price: product.price,
          quantity: 1,
        ),
      );
    }
  }

  void removeItemCart(Product product) {
    if (product != null) {
      _items.remove(
        product.id,
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void toggleShoppingCart(Product product) {
    if (product != null) {
      product.isShoppingCart = !product.isShoppingCart;
      notifyListeners();
    }
    //notifyListeners(); // notifica todos os interessados quando isShoppingCart mudar
  }

  void clear(){
    _items = {};
    notifyListeners();
  }
}
