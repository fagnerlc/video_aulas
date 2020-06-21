import 'package:flutter/material.dart';
import 'package:shop/providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  CartItemWidget(this.cartItem); // : super(key: key);

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
              padding: EdgeInsets.all(5),
              child: FittedBox(child: Text('R\$ ${cartItem.prince}')),
            ),
          ),
          title: Text(cartItem.title),
          subtitle: Text('Total: R\$ ${cartItem.prince * cartItem.quantity}'),
          //trailing: Text('${cartItem.quantity}x'),
          trailing: Container(
            width: 113,
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.arrow_left), onPressed: (){}),
                Text('${cartItem.quantity}x'),
                IconButton(icon: Icon(Icons.arrow_right), onPressed: (){}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
