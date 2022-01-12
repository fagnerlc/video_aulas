import 'package:facebook_interface_aula/componentes/botao_circulo.dart';
import 'package:facebook_interface_aula/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.orange,
            expandedHeight: 250,
            floating: true,
            centerTitle: false,
            title: const Text(
              'facebook',
              style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                //letterSpacing: 3, // define o espaçamento entre as letras
              ),
            ),
            actions: [
              BotaoCirculo(
                icone: Icons.search,
                iconeTamanho: 30,
                onPressed: () {},
              ),
              BotaoCirculo(
                icone: LineIcons.facebookMessenger,
                iconeTamanho: 30,
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.black45,
              height: 2000,
            ),
          ),
        ],
      ),
    );
  }
}
