import 'dart:io';
import 'package:get/get.dart';

class AuthFormData {
  String nome = '';
  String email = '';
  String senha = '';
  File? imagem;
  final RxBool _loginSingup = true.obs;

  get loginSingup => _loginSingup.value;
  set loginSingup(value) => _loginSingup.value = value;
}
