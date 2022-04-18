import 'package:chat_firebase/app/modules/auth/controllers/auth_controller.dart';
import 'package:chat_firebase/app/modules/auth/views/widgets/user_image_picker.dart';
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
        key: controller.formKey,
        child: Column(
          children: [
            Obx(() => Visibility(
                visible: !controller.authFormData.loginSingup,
                child: UserImagePicker(
                    // onImagePick: controller.handleImagePick,
                    ))),
            Obx(() => Visibility(
                visible: !controller.authFormData.loginSingup,
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, right: 15, left: 15),
                    child: CustomTextField(
                      prefixIcon: Icons.person,
                      labelText: 'Nome',
                      initialValue: controller.authFormData.nome,
                      onChanged: (nome) => controller.authFormData.nome = nome,
                      keyValue: 'name',
                      validatorFunction: (value) =>
                          controller.validatorName(value),
                    )))),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, right: 15, left: 15),
              child: CustomTextField(
                prefixIcon: Icons.email,
                labelText: 'E-mail',
                onChanged: (email) =>
                    controller.authFormData.email.value = email,
                keyValue: 'email',
                validatorFunction: (value) => controller.validatorEmail(value),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, right: 15, left: 15),
              child: CustomTextField(
                prefixIcon: Icons.password,
                labelText: 'Senha',
                keyValue: 'password',
                obscureText: true,
                onChanged: (senha) => controller.authFormData.senha = senha,
                suffixIconBool: true,
                suffixIconObscureTextBool: true,
                validatorFunction: (value) =>
                    controller.validatorPassword(value),
              ),
            ),
            Obx(
              () => CustomButton(
                text: controller.authFormData.loginSingup
                    ? 'ENTRAR'
                    : 'CADASTRAR',
                onPressed: () => controller.submit(context),
              ),
            ),
            Obx(
              () => CustomButtonText(
                text: controller.authFormData.loginSingup
                    ? 'Criar uma nova conta?'
                    : 'Já possui conta?',
                onPressed: controller.authFormData.authLoginSingup,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
