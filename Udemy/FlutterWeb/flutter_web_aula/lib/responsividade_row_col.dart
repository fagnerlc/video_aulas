import 'package:flutter/material.dart';

class ResponsividadeRowCol extends StatelessWidget {
  const ResponsividadeRowCol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width; // largura da tela
    var altura = MediaQuery.of(context).size.height; // altura da tela
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsividade Row Col'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 200,
              color: Colors.orange,
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 200,
                    color: Colors.yellow,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 200,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 200,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 200,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
