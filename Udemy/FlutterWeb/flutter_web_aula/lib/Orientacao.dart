import 'package:flutter/material.dart';

class Orientacao extends StatelessWidget {
  const Orientacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientação'),
      ),
      body: OrientationBuilder(builder: (context, orientacao) {
        // return Container(
        //   child: orientacao == Orientation.portrait
        //       ? Text('Portraint')
        //       : Text('Landscape'),
        // );
        return GridView.count(
          crossAxisCount: orientacao == Orientation.portrait ? 2 : 4,
          children: [
            Container(color: Colors.red),
            Container(color: Colors.green),
            Container(color: Colors.orange),
            Container(color: Colors.blue),
            Container(color: Colors.purple),
            Container(color: Colors.yellow),
          ],
        );
      }),
    );
  }
}
