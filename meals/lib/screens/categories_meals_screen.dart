import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category; // Subistitui o construtor
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(child: Text('Receitas por Categoria ${category.id}')),
    );
  }
}