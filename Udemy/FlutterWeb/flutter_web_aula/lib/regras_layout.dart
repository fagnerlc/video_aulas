import 'package:flutter/material.dart';

class RegrasLayout extends StatelessWidget {
  const RegrasLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width; // largura da tela
    var altura = MediaQuery.of(context).size.height; // altura da tela
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: largura,
        height: altura,
        color: Colors.orange,
        child: LayoutBuilder(
          builder: (context, constraint) {
            var larg = constraint.widthConstraints().maxWidth;
            print('LARGURA: $larg');
            print('LARGURA: $largura');
            if (largura < 600) {
              return Text('CELULAR');
            } else if (largura < 960) {
              return Text('Tablet');
            } else {
              return Text('Telas maiores');
            }
          },
        ),
      ),
    );
  }
}
