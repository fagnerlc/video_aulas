import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButton'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.add_shopping_cart),
        elevation: 6,
        label: Text('Adicionar'),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(7)),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      //floatingActionButton: FloatingActionButton(
      //child: Icon(Icons.add),
      //backgroundColor: Colors.purple,
      //foregroundColor: Colors.white,
      //elevation: 6,
      //mini: false,
      //onPressed: () {
      //  print('Resultado botao precionado');
      //},
      //),
      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            )
          ],
        ),
      ),
      body: Text('Conteudo'),
    );
  }
}
