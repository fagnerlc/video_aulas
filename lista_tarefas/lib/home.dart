import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaTarefas = [];

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    print("Caminho: ${diretorio.path}");
    return File('${diretorio.path}/dados.json');
  }

  _salvarArquivo() async {
    var arquivo = await _getFile();
    //Criar dados
    Map<String, dynamic> tarefa = Map();
    tarefa['titulo'] = 'Ir ao mercado';
    tarefa['realizada'] = false;
    _listaTarefas.add(tarefa);

    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
  }

  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      //e.toString();
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _lerArquivo().then((dados) {
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //_salvarArquivo();
    //print('Itens: ' + _listaTarefas.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de tarefas'),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Adicionar tarefa'),
                    content: TextField(
                      decoration:
                          InputDecoration(labelText: "Digite sua tarefa"),
                      onChanged: (text) {},
                    ),
                    actions: [
                      TextButton(
                        child: Text('Cancelar'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: Text('Salvar'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                });
          },
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _listaTarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_listaTarefas[index]["titulo"]),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
