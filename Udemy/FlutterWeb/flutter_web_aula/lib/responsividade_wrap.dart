import 'package:flutter/material.dart';

class ResponsividadeWrap extends StatelessWidget {
  const ResponsividadeWrap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var larguraTela = MediaQuery.of(context).size.width; // largura da tela
    var alturaTela = MediaQuery.of(context).size.height; // altura da tela
    double altura = 100;
    double largura = 200;
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap'),
      ),
      body: Container(
        color: Colors.black26,
        width: larguraTela,
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            Container(
              width: largura,
              height: altura,
              color: Colors.orange,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.green,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.purple,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.black,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
