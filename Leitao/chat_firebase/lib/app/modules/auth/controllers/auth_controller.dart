import 'package:chat_firebase/app/data/models/auth/auth_form_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var _formKey = GlobalKey<FormState>();
  final Rx<AuthFormData> _authFormData = Rx<AuthFormData>(AuthFormData());
  final RxBool _isLogin = true.obs;

  get formKey => _formKey;
  set formKey(value) => _formKey = value;

  get isLogin => _isLogin.value;
  set isLogin(value) => _isLogin.value = value;

  get authFormData => _authFormData.value;
  set authFormData(value) => _authFormData.value = value;

  void submit() {
    _formKey.currentState?.validate();
  }

  final count = 0.obs;
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
  void increment() => count.value++;
}
