import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/pedidos.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/pedido_widget.dart';

class PedidosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      body: FutureBuilder(
        future: Provider.of<Pedidos>(context, listen: false).loadPedidos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('Ocorreu um erro inesperado!'));
          } else {
            return Consumer<Pedidos>(
              builder: (context, pedidos, child) {
                return ListView.builder(
                  itemCount: pedidos.itemsPedidosCount,
                  itemBuilder: (ctx, i) =>
                      PedidoWidget(pedidos.itemsPedidos[i]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
