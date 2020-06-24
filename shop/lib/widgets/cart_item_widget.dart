import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import '../providers/cart.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;

  CartItemWidget(this.cartItem);


  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  //final Product product = Provider.of<Product>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.cartItem.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 10),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false)
            .removeItem(widget.cartItem.productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(3),
                child: FittedBox(
                  child: Text('R\$ ${widget.cartItem.price}'),
                ),
              ),
            ),
            title: Text(widget.cartItem.title),
            subtitle: Text(
                'Total: R\$ ${(widget.cartItem.price * widget.cartItem.quantity).toStringAsFixed(2)}'),
            trailing: Container(
              //padding: EdgeInsets.all(3),
              width: 135,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: () {
                      //cartItem.quantity > 0 ? cartItem.quantity = cartItem.quantity - 1 : Provider.of<Cart>(context, listen: false).removeItem(cartItem.productId);

                      if (widget.cartItem.quantity <=1) {
                        widget.cartItem.quantity = widget.cartItem.quantity - 1;
                        
                        Provider.of<Cart>(context, listen: false)
                            .removeItem(widget.cartItem.productId);
                        //Provider.of<Cart>(context, listen: false).toggleShoppingCart(Provider.of<Product>(context));
                      } else {
                        setState(() {
                        widget.cartItem.quantity = widget.cartItem.quantity - 1;
                        
                        });
                      }
                    },
                  ),
                  Container(
                    height: 27,
                    width: 39,
                    child: FittedBox(
                      child: Text('${widget.cartItem.quantity}x'),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_right),
                    onPressed: () {
                      setState(() { // transformar em statfull para funcionar

                      widget.cartItem.quantity = widget.cartItem.quantity + 1;
                      //Provider.of<Cart>(context, listen: false).addItem(Provider.of<Product>(context));
                      });
                    },
                  ),
                ],
              ),
            ),
            //trailing: Text('${cartItem.quantity}x'),
          ),
        ),
      ),
    );
  }
}
