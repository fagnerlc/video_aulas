import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() => runApp(MaterialApp(
      title: 'Criar Clock',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    ));

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  double seconds;

  _currentTime() {
    return "${DateTime.now().hour} : ${DateTime.now().minute}";
  }

  _triggerUpdate() {
    Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) => setState(
              () {
                seconds = DateTime.now().second / 60;
              },
            ));
  }

  @override
  void initState() {
    super.initState();
    seconds = DateTime.now().second / 60;
    _triggerUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: hexToColor('#E3E3ED'),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: hexToColor('#2c3143'),
                  ),
                ),
              ),
              Center(
                child: Container(
                    margin: const EdgeInsets.all(36.0),
                    width: 340,
                    height: 340,
                    child: Center(
                      child: Text(
                        _currentTime(),
                        style: GoogleFonts.bungee(
                            fontSize: 60.0,
                            textStyle: TextStyle(color: Colors.white),
                            fontWeight: FontWeight.normal),
                      ),
                    )),
              ),
              Center(
                child: CircularPercentIndicator(
                  radius: 250.0,
                  lineWidth: 6.0,
                  animation: true,
                  percent: seconds,
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: hexToColor('#2c3143'),
                  progressColor: hexToColor('#58CBF4'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
