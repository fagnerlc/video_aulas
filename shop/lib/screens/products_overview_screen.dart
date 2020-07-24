import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/badge.dart';
//import 'package:provider/provider.dart';
import 'package:shop/widgets/product_grid.dart';
//import '../providers/products.dart';

enum FilterOptions {
  Favorite,
  All,
}

// widget era Stateless no modo de gerenciar tudo pelo provider e sem o SetState
class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavoriteOnly = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // carregar os produtos
    Provider.of<Products>(context, listen: false).loadProducts().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //final Products products = Provider.of(context); //Exemplo de privider com tela sistema inteiro
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Center(child: Text('Minha loja')),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectetdValue) {
              setState(() {
                if (selectetdValue == FilterOptions.Favorite) {
                  _showFavoriteOnly = true;
                  //products.showFavoriteOnly(); // gerenciamento de forma global
                } else {
                  _showFavoriteOnly = false;
                  //products.showAll(); // gerenciamento de forma global
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente Favoritos'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
            ),
            builder: (_, cart, child) => Badge(
              value: cart.itemsCount.toString(),
              child: child,
            ),
          ),
        ],
      ),
      // agora a renderização do provider é feita apenas neste componente ProductGrid
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductGrid(_showFavoriteOnly),
    );
  }
}
