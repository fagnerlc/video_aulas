import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    //final Cart cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.PRODUCT_DETAIL,
              arguments: product,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            // consumer substitui o provider.of
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () => product.toggleFavorite(),
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: Consumer<Cart>(
            builder: (ctx, cart, _) => IconButton(
              icon: Icon(
                product.isShoppingCart
                    ? Icons.shopping_cart
                    : Icons.add_shopping_cart,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                //Scaffold.of(context).openDrawer(); // ele sove na arvore de hierarquia até encontrar o Scafold mais próximo que tenha Drawer
                cart.toggleShoppingCart(product);
                Scaffold.of(context)
                    .hideCurrentSnackBar(); //esconde a snackbar atual pra apresentar a próxima
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: product.isShoppingCart
                        ? Text('Produto adicionado com sucesso!',
                            textAlign: TextAlign.center)
                        : Text('Produto removido com sucesso!',
                            textAlign: TextAlign.center),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: product.isShoppingCart ? 'Desfazer!' : '',
                      onPressed: () {
                        cart.removeUnidade(product.id);
                        cart.toggleShoppingCart(product);
                      },
                    ),
                  ),
                );
                product.isShoppingCart
                    ? cart.addItem(product)
                    : cart.removeItemCart(product);
              },
            ),
          ),
        ),
      ),
    );
  }
}
