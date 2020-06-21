import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite; // atributo que vai ser modificado
  bool isShoppingCart;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
    this.isShoppingCart = false,
  });



  void toggleFavorite(){
    isFavorite = !isFavorite;
    notifyListeners(); // notifica todos os interessados quando isFavorite mudar
  }

}
