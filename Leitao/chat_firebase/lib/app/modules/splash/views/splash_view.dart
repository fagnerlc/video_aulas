import 'package:chat_firebase/app/data/models/auth/usuario.dart';
import 'package:chat_firebase/app/data/services/auth/auth_mock_service.dart';
import 'package:chat_firebase/app/modules/auth/controllers/auth_controller.dart';
import 'package:chat_firebase/app/modules/auth/views/auth_view.dart';
import 'package:chat_firebase/app/modules/chat/views/chat_view.dart';
import 'package:chat_firebase/widgets/loading_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Get.put<AuthController>(AuthController());

    return Scaffold(
      body: StreamBuilder<Usuario?>(
        stream: AuthMockService().userChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            return snapshot.hasData ? ChatView() : AuthView();
          }
        },
      ),
    );
  }
}
