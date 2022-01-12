import 'package:flutter/material.dart';
import 'package:flutter_web_aula/Orientacao.dart';
import 'package:flutter_web_aula/regras_layout.dart';
import 'package:flutter_web_aula/responsividade_media_query.dart';
import 'package:flutter_web_aula/responsividade_row_col.dart';
import 'package:flutter_web_aula/responsividade_wrap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ResponsividadeMediaQuery(),
      // home: const ResponsividadeRowCol(),
      // home: const Orientacao(),
      home: const RegrasLayout(),
    );
  }
}
