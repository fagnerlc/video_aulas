import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/http_exception.dart';
import 'package:shop/providers/product.dart';

// Tem o objetivo de encapsular a lista das Fazendas
// ChangeNotifier = notifica todos os interessandos quando haver mudança
class Products with ChangeNotifier {
  // o ideal é criar um arquivo separado com as variáveis constantes
  final String _baseUrl = 'https://teste-0749.firebaseio.com/products';
  List<Product> _items = [];

  //[..._items] = retorna uma cópia de items para não aletrar o valor original = melhor prática
  List<Product> get items => [..._items];

  List<Product> get favotiteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  int get itemsCount {
    return _items.length;
  }

  //carregar os produtos dentro de items.
  Future<void> loadProducts() async {
    final response = await http.get("$_baseUrl.json");
    Map<String, dynamic> data = json.decode(response.body);

    // abaixo ele vai limpar a lista de produtos para não duplicar a lista ao ser chamada.
    _items.clear();
    if (data != null) {
      data.forEach((productId, productData) {
        _items.add(Product(
          id: productId,
          title: productData['title'],
          description: productData['description'],
          price: productData['price'],
          imageUrl: productData['imageUrl'],
          isFavorite: productData['isFavorite'],
        ));
      });
      //print(json.decode(response.body));
      notifyListeners();
    }
    return Future.value();
  }

  // se alguem chama o metódo para add
  Future<void> addProduct(Product newProduct) async {
    //await substitui o then
    final response = await http.post(
      "$_baseUrl.json",
      body: json.encode({
        'title': newProduct.title,
        'description': newProduct.description,
        'price': newProduct.price,
        'imageUrl': newProduct.imageUrl,
        'isFavorite': newProduct.isFavorite,
      }),
    );

    _items.add(Product(
      id: json.decode(response.body)['name'],
      title: newProduct.title,
      description: newProduct.description,
      price: newProduct.price,
      imageUrl: newProduct.imageUrl,
    ));
    //notifyListeners = vai notificar todos os interessados quando o evento for chamado
    notifyListeners();
  }

  Future<void> updateProduct(Product product) async {
    if (product == null || product.id == null) {
      return;
    }
    //linha abaixo encontra o produto a ser alterado
    final index = _items.indexWhere((prod) => prod.id == product.id);
    if (index >= 0) {
      await http.patch(
        "$_baseUrl/${product.id}.json",
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
        }),
      );
      _items[index] = product;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    //linha abaixo encontra o produto a ser deletado
    final index = _items.indexWhere((prod) => prod.id == id);
    if (index >= 0) {
      final product = _items[index];
      _items.remove(product);
      notifyListeners();
      final response = await http.delete("$_baseUrl/${product.id}.json");
      if (response.statusCode >= 400) {
        _items.insert(index, product);
        notifyListeners();
        throw HttpException('Ocorreu um erro na exclusão do produto.');
      }
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
