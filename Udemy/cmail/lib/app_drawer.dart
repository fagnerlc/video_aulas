import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            centerTitle: true,
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.dehaze),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          Container(
            height: 75,
            width: 75,
            child: ClipOval(
              child: Container(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sair"),
                Icon(Icons.logout),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              children: [
                InkWell(
                  child: ListTile(
                    title: Text(
                      'Teste',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
