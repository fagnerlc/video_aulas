import 'package:chat_firebase/app/modules/auth/views/widgets/auth_form.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('AuthView'),
        centerTitle: true,
      ),
      body: Obx(() => Stack(
            children: [
              const Center(
                child: SingleChildScrollView(
                  child: AuthForm(),
                ),
              ),
              if (controller.isLoading.value)
                Container(
                  color: Colors.black45,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          )),
    );
  }
}
