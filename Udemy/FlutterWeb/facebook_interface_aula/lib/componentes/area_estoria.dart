import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:facebook_interface_aula/modelos/modelos.dart';

class AreaEstoria extends StatelessWidget {
  final Usuario usuario;
  final List<Estoria> estorias;
  const AreaEstoria({
    Key? key,
    required this.usuario,
    required this.estorias,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          itemCount: estorias.length,
          itemBuilder: (context, idx) {
            Estoria estoria = estorias[idx];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CartaoEstoria(
                estoria: estoria,
              ),
            );
          }),
    );
  }
}

class CartaoEstoria extends StatelessWidget {
  final Estoria estoria;
  const CartaoEstoria({
    Key? key,
    required this.estoria,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: estoria.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
