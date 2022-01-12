import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.calcula,
              child: Text('calcula'),
            ),
            ElevatedButton(
              onPressed: () => controller.calculaNum(8),
              child: Text('calculaNum'),
            ),
            ElevatedButton(
              onPressed: () {
                String? suaString = null;
                //controller.stringNaoNula(suaString);
              },
              child: Text('stringNaoNula'),
            ),
          ],
        ),
      ),
    );
  }
}
