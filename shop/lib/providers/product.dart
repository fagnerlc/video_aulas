import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constantes.dart';

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

  Future<void> toggleFavorite(String token, String userId) async {
    _toggleFavorite();
    // o ideal é criar um arquivo separado com as variáveis constantes
    try {
      final url =
          'h${Constantes.BASE_API_URL}/userFavorites/$userId/$id.json?auth=$token';
      final response = await http.put(
        url,
        body: json.encode(isFavorite),
      );

      if (response.statusCode >= 400) {
        _toggleFavorite();
      }
    } catch (error) {
      _toggleFavorite();
    }
  }
}
