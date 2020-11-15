import 'package:cmail/app_drawer.dart';
import 'package:flutter/material.dart';

class CmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título da página atual!'),
      ),
      drawer: AppDrawer(),
    );
  }
}
