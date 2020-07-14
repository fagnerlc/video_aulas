import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:shop/providers/cart.dart';

class Pedido {
  final String id;
  final double amount;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  Pedido({
    this.id,
    this.amount,
    this.total,
    this.products,
    this.date,
  });
}

class Pedidos with ChangeNotifier {
  List<Pedido> _itemsPedidos = [];

  List<Pedido> get itemsPedidos {
    return [..._itemsPedidos];
  }

  int get itemsPedidosCount {
    return _itemsPedidos.length;
  }

  //void addPedido(List<CartItem> products, double total) { //1
  void addPedido(Cart cart) {
    //final combine = (previousTotal, element) =>
    //    previousTotal + (element.price * element.quantity);
    //final total = products.fold(0.0, combine);
    _itemsPedidos.insert(
      0,
      Pedido(
        id: Random().nextDouble().toString(),
        //total: total, //1
        total: cart.totalAmount,
        date: DateTime.now(),
        //products: products, //1
        products: cart.items.values.toList(),
      ),
    );
    notifyListeners();
  }
}
