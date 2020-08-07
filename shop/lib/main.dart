import 'package:flutter/material.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/pedidos.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/auth_home_screen.dart';
import 'package:shop/screens/product_form_screen.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/pedidos_screen.dart';
import 'package:shop/screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import 'screens/products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => new Products(),
          update: (ctx, auth, previousProducts) => new Products(
            auth.token,
            auth.userId,
            previousProducts.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => new Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Pedidos>(
          create: (_) => new Pedidos(),
          update: (ctx, auth, previousPedidos) => new Pedidos(
              auth.token, auth.userId, previousPedidos.itemsPedidos),
        ),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Lato',
        ),
        //home: ProductOverviewScreen(),
        routes: {
          AppRoutes.AUTH_HOME: (ctx) => AuthHomeScreen(),
          //AppRoutes.AUTH: (ctx) => AuthScreeen(),
          AppRoutes.HOME: (ctx) => ProductOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen(),
          AppRoutes.PEDIDOS: (ctx) => PedidosScreen(),
          AppRoutes.PRODUCTS: (ctx) => ProductsScreen(),
          AppRoutes.PRODUCTS_FORM: (ctx) => ProductFormScreen(),
        },
      ),
    );
  }
}
