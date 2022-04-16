import 'package:chat_firebase/app/data/models/auth/auth_form_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var _formKey = GlobalKey<FormState>();
  AuthFormData _authFormData = AuthFormData();

  get formKey => _formKey;
  set formKey(value) => _formKey = value;

  get authFormData => _authFormData;
  set authFormData(value) => _authFormData = value;

  void submit() {
    _formKey.currentState?.validate();
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
