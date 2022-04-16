import 'package:chat_firebase/app/modules/auth/controllers/auth_controller.dart';
import 'package:chat_firebase/widgets/custom_button.dart';
import 'package:chat_firebase/widgets/custom_button_text.dart';
import 'package:chat_firebase/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthForm extends GetView<AuthController> {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black45,
      child: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, right: 15, left: 15),
              child: CustomTextField(
                prefixIcon: Icons.person,
                labelText: 'Nome',
                // suffixIconBool: true,
                // suffixIcon: Icons.text_snippet,
                suffixIconFunction: () {
                  debugPrint('Yes');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, right: 15, left: 15),
              child: CustomTextField(
                prefixIcon: Icons.email,
                labelText: 'Email',
                // suffixIconBool: true,
                // suffixIcon: Icons.text_snippet,
                suffixIconFunction: () {
                  debugPrint('Yes');
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, right: 15, left: 15),
              child: CustomTextField(
                prefixIcon: Icons.password,
                labelText: 'Senha',
                obscureText: true,
                suffixIconBool: true,
                suffixIconObscureTextBool: true,
              ),
            ),
            Obx(() => CustomButton(
                text:
                    'Entrar ${controller.count} ${controller.authFormData.isLogin}',
                onPressed: controller.increment)),
            Obx(
              () => CustomButtonText(
                text: controller.authFormData.isLogin
                    ? 'Criar uma nova conta? ${controller.authFormData.isLogin}'
                    : 'Já possui conta? ${controller.authFormData.isLogin}',
                onPressed: () => controller.authFormData.toogleAuthMode(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
