import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'utils/app_routes.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar!',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        accentColor:  Colors.tealAccent,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 20,
            fontFamily:'RobotoCondensed',
          )
        )

      ),
      //home: CategoriesScreen(), // = '/' : (ctx) => CategoriesScreen(),
      routes: {
        AppRoutes.HOME : (ctx) => CategoriesScreen(),
        AppRoutes.CATECORIES_MEALS : (ctx) => CategoriesMealsScreen(),
      },
    );
  }
}
 