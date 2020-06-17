import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import '../widgets/product_item.dart';
import '../providers/products.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<Products>(context);
    final products = productsProvider.items;


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Minha loja')),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (ctx, idx) => ProductItem(products[idx]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
