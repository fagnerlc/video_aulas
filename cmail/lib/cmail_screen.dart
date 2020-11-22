import 'package:cmail/app_drawer.dart';
import 'package:flutter/material.dart';

class CmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Título da página atual!'),
        actions: [
          Icon(Icons.search),
          Container(
            width: 250,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Filtrar e-mails...',
                fillColor: Colors.white,
                focusColor: Colors.white,
                hoverColor: Colors.white,
              ),
              cursorColor: Colors.white,
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
