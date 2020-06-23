import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/pedidos.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/pedido_widget.dart';

class PedidosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pedidos pedidos = Provider.of(context);
    //final pedidoItems = pedidos.itemsPedidos;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      body: ListView.builder(
        itemCount: pedidos.itemsPedidosCount,
        itemBuilder: (ctx, i) => PedidoWidget(pedidos.itemsPedidos[i]),
      ),
    );
  }
}
