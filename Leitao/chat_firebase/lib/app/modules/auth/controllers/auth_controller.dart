import 'dart:async';
import 'dart:io';
import 'package:chat_firebase/app/data/models/auth/auth_form_data.dart';
import 'package:chat_firebase/app/data/services/auth/auth_mock_service.dart';
import 'package:chat_firebase/utils/alertas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  var _formKey = GlobalKey<FormState>();
  AuthFormData _authFormData = AuthFormData();
  RxBool isLoading = false.obs;

  get formKey => _formKey;
  set formKey(value) => _formKey = value;

  get authFormData => _authFormData;
  set authFormData(value) => _authFormData = value;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage != null) {
      authFormData.image = File(pickedImage.path);
    }
  }

  // Valida Nome
  String? validatorName(String? _name) {
    final name = _name ?? '';
    if (name.trim().length < 3) {
      return 'Nome deve ter no mínimo 3 caracteres.';
    }
    return null;
  }

  // Valida Email
  String? validatorEmail(String? _email) {
    final email = _email ?? '';
    if (!email.contains('@')) {
      return 'E-mail informado não é válido.';
    }
    return null;
  }

  // Valida Senha
  validatorPassword(_password) {
    final password = _password ?? '';
    if (password.length < 3) {
      return 'Senha deve ter no mínimo 4 caracteres.';
    }
    return null;
  }

  showError(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).errorColor,
      ),
    );
  }

  void submit(BuildContext context) async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    debugPrint('${authFormData.loginSingup}');
    if (authFormData.image == null && !authFormData.loginSingup) {
      return Alertas().showErrorDialog(
        'Selecione Imagem!',
        'Imagem não selecionada!',
        context,
      );
    }
    try {
      isLoading.value = true;
      if (_authFormData.loginSingup) {
        // LOGIN
        AuthMockService().login(
          _authFormData.email.value,
          _authFormData.senha,
        );
      } else {
        // SIGNUP
        AuthMockService().signup(
          _authFormData.nome,
          _authFormData.email.value,
          _authFormData.cpf,
          _authFormData.telefone,
          _authFormData.image,
        );
      }
    } on Exception catch (e) {
      // TRATAR ERRO
    }
    await Future.delayed(const Duration(seconds: 4));
    debugPrint('AGORA');
    isLoading.value = false;
  }

  void increment() => _count.value++;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  final _count = 0.obs;
  get count => _count.value;
  set count(value) => _count.value = value;
}
