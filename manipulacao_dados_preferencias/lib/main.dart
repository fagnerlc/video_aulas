import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manipulacao_dados_preferencias/app/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    title: "Concessão de Benefício",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    debugShowCheckedModeBanner: false,
  ));
}
