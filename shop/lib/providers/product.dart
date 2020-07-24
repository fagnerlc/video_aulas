import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite; // atributo que vai ser modificado
  bool isShoppingCart;

  Product({
    this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
    this.isShoppingCart = false,
  });

  void _toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners(); // notifica todos os interessados quando isFavorite mudar
  }

  Future<void> toggleFavorite() async {
    _toggleFavorite();
    // o ideal é criar um arquivo separado com as variáveis constantes
    try {
      final _url = 'https://teste-0749.firebaseio.com/products/$id.json';
      final response = await http.patch(
        _url,
        body: json.encode({
          'isFavorite': isFavorite,
        }),
      );

      if (response.statusCode >= 400) {
        _toggleFavorite();
      }
    } catch (e) {
      _toggleFavorite();
    }
  }
}
