import 'dart:io';

import 'package:chat_firebase/app/data/models/auth/usuario.dart';

abstract class AuthService {
  Usuario? get currentUser;

  Stream<Usuario?> get userChanges;

  Future<void> signup(
    String nome,
    String email,
    String? cpf,
    String? telefone,
    File? image,
  );

  Future<void> login(
    String email,
    String senha,
  );

  Future<void> logout();
}
