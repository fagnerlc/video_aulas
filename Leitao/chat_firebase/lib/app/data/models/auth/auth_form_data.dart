import 'dart:io';
import 'package:get/get.dart';

class AuthFormData {
  String nome = '';
  RxString email = ''.obs;
  String senha = '';
  String? cpf;
  String? telefone;
  final RxBool _loginSingup = true.obs;

  final _image = Rxn<File>();
  get image => _image.value;
  set image(value) => _image.value = value;

  get loginSingup => _loginSingup.value;
  set loginSingup(value) => _loginSingup.value = value;

  authLoginSingup() {
    loginSingup = !loginSingup;
  }
}
