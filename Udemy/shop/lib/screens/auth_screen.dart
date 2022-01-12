import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/widgets/auth_card.dart';

class AuthScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.teal,
                  Colors.black12,
                  Colors.teal,
                  //Color.fromRGBO(1, 255, 255, 0.7),
                  //Color.fromRGBO(1, 255, 150, 0.3),
                  //Color.fromRGBO(1, 255, 255, 0.7),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, 7)),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 70,
                  ),
                  transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                  child: Text(
                    'Minha Loja',
                    style: TextStyle(
                        color:
                            Theme.of(context).accentTextTheme.headline6.color,
                        fontSize: 45,
                        fontFamily: 'Anton'),
                  ),
                ),
                AuthCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
