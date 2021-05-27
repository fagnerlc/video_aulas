import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _lista = ['Fagner', 'Lorena', 'Fabiano', 'Livia'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Widgets"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _lista.length,
              itemBuilder: (ctx, idx) {
                final item = _lista[idx];
                return Dismissible(
                  background: Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  //direction: DismissDirection.vertical,
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      print("direção");
                    } else if (direction == DismissDirection.startToEnd) {
                      print("direção");
                    }

                    setState(() {
                      _lista.removeAt(idx);
                    });
                    print("direção" + direction.toString());
                  },
                  key: Key(item),
                  child: ListTile(
                    title: Text(item),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
