import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerCampo = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Obx(() => Text(
                  controller.textoSalvo,
                  style: TextStyle(fontSize: 20),
                )),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Digite algo'),
              controller: _controllerCampo,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    controller.salvar(_controllerCampo.text);
                  },
                ),
                ElevatedButton(
                  child: Text('Recuperar'),
                  onPressed: () {
                    controller.recuperar();
                  },
                ),
                ElevatedButton(
                  child: Text('Remover'),
                  onPressed: () {
                    controller.remover();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
