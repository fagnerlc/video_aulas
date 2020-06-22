import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';

import '../providers/cart.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;

  CartItemWidget(this.cartItem);
  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
                child: Text('R\$ ${widget.cartItem.prince}'),
              ),
            ),
          ),
          title: Text(widget.cartItem.title),
          subtitle: Text(
              'Total: R\$ ${(widget.cartItem.prince * widget.cartItem.quantity).toStringAsFixed(2)}'),
          //trailing: Text('${cartItem.quantity}x'),
          trailing: Container(
            //padding: EdgeInsets.all(3),
            width: 135,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () {
                    setState(() {
                      if (widget.cartItem.quantity <= 0) {
                        widget.cartItem.quantity = 0;
                      } else {
                        widget.cartItem.quantity =
                            widget.cartItem.quantity - 1;
                      }
                    });
                  },
                ),
                Container(
                  //padding: const EdgeInsets.all(1),
                  child: Container(
                    height: 27,
                    width: 39,
                    child: FittedBox(
                      child: Text('${widget.cartItem.quantity}x'),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () {
                    setState(() {
                      widget.cartItem.quantity = widget.cartItem.quantity + 1;
                      //(cart.totalAmount).toStringAsFixed(2);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
