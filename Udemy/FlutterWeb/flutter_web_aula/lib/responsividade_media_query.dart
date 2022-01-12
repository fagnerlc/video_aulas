import 'package:flutter/material.dart';

class ResponsividadeMediaQuery extends StatefulWidget {
  const ResponsividadeMediaQuery({Key? key}) : super(key: key);

  @override
  _ResponsividadeMediaQueryState createState() =>
      _ResponsividadeMediaQueryState();
}

class _ResponsividadeMediaQueryState extends State<ResponsividadeMediaQuery> {
  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width; // largura da tela
    var altura = MediaQuery.of(context).size.height; // altura da tela
    var alturaBarraStatus =
        MediaQuery.of(context).padding.top; // tamanho da barra de status
    var alturaAppBar = AppBar().preferredSize.height; // tamanho da appbar
    // var larguraItem = largura * 0.25;
    var larguraItem = largura / 3;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Responsividade",
        ),
      ),
      body: Row(
        children: [
          Container(
            width: larguraItem,
            height: 200,
            // height: altura - alturaBarraStatus - alturaAppBar,
            color: Colors.red,
            child: const Text('Responsividade'),
          ),
          Container(
            width: larguraItem,
            height: 200,
            // height: altura - alturaBarraStatus - alturaAppBar,
            color: Colors.black,
            child: const Text('Responsividade'),
          ),
          Container(
            width: larguraItem,
            height: 200,
            // height: altura - alturaBarraStatus - alturaAppBar,
            color: Colors.black45,
            child: const Text('Responsividade'),
          ),
        ],
      ),
    );
  }
}
