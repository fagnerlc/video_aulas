import 'package:flutter/material.dart';

class Frases extends StatefulWidget {
  @override
  _FrasesState createState() => _FrasesState();
}

class _FrasesState extends State<Frases> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          color: Colors.black12,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Teste"),
              RaisedButton(
                onPressed: (){},
                child: Text("Mudar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
