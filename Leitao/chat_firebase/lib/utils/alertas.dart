import 'package:flutter/material.dart';

class Alertas {
  void showErrorDialog(String title, String msg, BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Fechar"))
        ],
      ),
    );
  }
}
