import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/pedidos.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/widgets/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final cartItems = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(25),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      //'R\$ ${(cart.totalAmount).toStringAsFixed(2)}',
                      'R\$ ${Provider.of<Cart>(context, listen: false).totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6.color,
                      ),
                    ),
                  ),
                  Spacer(),
                  FlatButton(
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Text('COMPRAR'),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: cart.totalAmount == 0
                        ? null
                        : () async {
                            setState(() {
                              isLoading = true;
                            });
                            await Provider.of<Pedidos>(context, listen: false)
                                .addPedido(
                                    //cartItems, //1
                                    //cart.totalAmount, //1
                                    cart);
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.of(context).pushNamed(AppRoutes.PEDIDOS);
                            cart.clear();
                          },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemsCount,
              itemBuilder: (ctx, i) => CartItemWidget(cartItems[i]),
            ),
          ),
        ],
      ),
    );
  }
}
