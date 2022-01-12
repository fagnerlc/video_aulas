import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/providers/cart.dart';
import 'package:shop/utils/constantes.dart';

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
  final String _baseUrl = '${Constantes.BASE_API_URL}/pedidos';
  List<Pedido> _itemsPedidos = [];
  String _token;
  String _userId;
  Pedidos([this._token, this._userId, this._itemsPedidos = const []]);
  List<Pedido> get itemsPedidos {
    return [..._itemsPedidos];
  }

  int get itemsPedidosCount {
    return _itemsPedidos.length;
  }

  Future<void> loadPedidos() async {
    List<Pedido> loadedItems = [];
    final response = await http.get("$_baseUrl/$_userId.json?auth=$_token");
    Map<String, dynamic> data = json.decode(response.body);

    print(data);
    if (data != null) {
      data.forEach((pedidoId, pedidoData) {
        loadedItems.add(
          Pedido(
            id: pedidoId,
            total: pedidoData['total'],
            date: DateTime.parse(pedidoData['date']),
            products: (pedidoData['products'] as List<dynamic>).map((item) {
              return CartItem(
                id: item['id'],
                price: item['price'],
                productId: item['productId'],
                quantity: item['quantity'],
                title: item['title'],
              );
            }).toList(),
          ),
        );
      });
      //print(json.decode(response.body));
      notifyListeners();
    }
    // pega os items e coloca na ordem inversa
    _itemsPedidos = loadedItems.reversed.toList();
    return Future.value();
  }

  //void addPedido(List<CartItem> products, double total) { //1
  Future<void> addPedido(Cart cart) async {
    //final combine = (previousTotal, element) =>
    //    previousTotal + (element.price * element.quantity);
    //final total = products.fold(0.0, combine);
    final date = DateTime.now();
    final response = await http.post(
      "$_baseUrl/$_userId.json?auth=$_token",
      body: json.encode({
        'total': cart.totalAmount,
        'date': date
            .toIso8601String(), // coloca num formato padrao fácil de reverter do backend
        'products': cart.items.values
            .map((cartItem) => {
                  'id': cartItem.id,
                  'price': cartItem.price,
                  'productId': cartItem.productId,
                  'quantity': cartItem.quantity,
                  'title': cartItem.title,
                })
            .toList()
      }),
    );

    _itemsPedidos.insert(
      0,
      Pedido(
        id: json.decode(response.body)['name'],
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
