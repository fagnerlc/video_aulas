import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerIdade = TextEditingController();
  String nome;
  int idade;

  Future<Database> _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, 'banco.db');
    var bd = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersaoRecente) {
        String sql =
            "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) ";
        db.execute(sql);
      },
    ); //openDatabase cria o banco de dados
    return bd;
    //print('Aperto: ' + retorno.isOpen.toString());
  }

  _salvar() async {
    Database db = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "nome": nome,
      "idade": idade,
    };
    int id = await db.insert("usuarios", dadosUsuario);
    print('Salvo: $id ');
  }

  _listarUsuarios() async {
    Database db = await _recuperarBancoDados();
    String sql = 'SELECT * FROM usuarios';
    List usuarios = await db.rawQuery(sql);
    print('usuarios: ' + usuarios.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _controllerNome,
              decoration: InputDecoration(labelText: "Nome"),
              onChanged: (text) {
                nome = text;
              },
            ),
            TextField(
              controller: _controllerIdade,
              decoration: InputDecoration(labelText: "Idade"),
              onChanged: (text) {
                idade = int.parse(text);
              },
            ),
            ElevatedButton(
              child: Text(
                'Salvar',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _salvar();
              },
            ),
            ElevatedButton(
              child: Text(
                'Mostrar',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _listarUsuarios();
              },
            ),
          ],
        ),
      ),
    );
  }
}
