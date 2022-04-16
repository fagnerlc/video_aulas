import 'dart:io';

enum AuthMode { signup, login }

class AuthFormData {
  String nome = '';
  String email = '';
  String senha = '';
  File? imagem;
  AuthMode _mode = AuthMode.login;

  bool get isLogin {
    return _mode == AuthMode.login;
  }

  bool get isSignup {
    return _mode == AuthMode.signup;
  }

  void toogleAuthMode() {
    _mode = isLogin ? AuthMode.signup : AuthMode.login;
  }
}
