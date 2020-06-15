import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import '../screens/categories_meals_screen.dart';
import '../utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    //Navigator.of(context).push(
    //  MaterialPageRoute(builder: (_) {
    //    return CategoriesMealsScreen(category: category);
    //  }),
    //);

    Navigator.of(context).pushNamed(AppRoutes.CATECORIES_MEALS,
    arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // InkWell ele apresenta funções que transforma a área selecionada em botão passando assim uma função.
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context)
          .primaryColor, // splashColor da o efeito ao clicar na aŕea selecionada
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.5),
            category.color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
      ),
    );
  }
}
