import 'dart:math';

import 'package:chat_firebase/app/data/models/auth/usuario.dart';
import 'dart:io';
import 'dart:async';

import 'package:chat_firebase/app/data/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static Map<String, Usuario> _usuarios = {};
  static Usuario? _usuarioCorrente;
  static MultiStreamController<Usuario?>? _controller;
  static final _userStream = Stream<Usuario?>.multi((controller) {
    _controller = controller;
    _updateUser(null);
  });

  @override
  Usuario? get currentUser {
    return _usuarioCorrente;
  }

  @override
  Stream<Usuario?> get userChanges => _userStream;

  @override
  Future<void> signup(
    String nome,
    String email,
    String? cpf,
    String? telefone,
    File? image,
  ) async {
    final newUser = Usuario(
      idUsuario: Random().nextDouble().toString(),
      nome: nome,
      email: email,
      urlImagem: image?.path ?? '/assets/images/...',
    );

    _usuarios.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Future<void> login(String email, String senha) async {
    _updateUser(_usuarios[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(Usuario? usuario) {
    _usuarioCorrente = usuario;
    _controller?.add(_usuarioCorrente);
  }
}
