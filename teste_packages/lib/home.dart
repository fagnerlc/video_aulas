import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperar() async {
    String url =
        'https://apigatewayhmg.previ.com.br/previ/hmg/public/oauth2/token';
    Map<String, dynamic> body = {
      'grant_type': 'password',
      'client_id': 'e3e6083a-bac0-41c6-b0d3-0e24f3d7306e',
      'username': '1694891',
      'password': '123456',
      'scope': 'app-previ',
    };

    http.Response response;

    response = await http.post(
      url,
      body: body,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': '*/*',
      },
    );

    print("resposta: " + response.statusCode.toString());
    print("resposta: " + response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo de serviço'),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            RaisedButton(
              onPressed: _recuperar,
              child: Text('Clique aqui'),
            )
          ],
        ),
      ),
    );
  }
}
