import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final User user = User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: ListView(
              // shrinkWrap Ocupa o menor espaço possível
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Nome Completo'),
                  validator: (name) {
                    if (name.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (name.trim().split(' ').length <= 1) {
                      return 'Preencha seu Nome Completo';
                    }
                  },
                  onSaved: (name) => user.name = name,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (!emailValid(email)) {
                      return 'E-mail inválido';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (email) => user.email = email,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (senha) {
                    if (senha.isEmpty) {
                      return 'Campo Obrigatório';
                    } else if (senha.length < 7) {
                      return 'Senha mínima com 7 caracteres';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (pass) => user.senha = pass,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Repita a Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (senha) {
                    if (senha.isEmpty) {
                      return 'Campo Obrigatório';
                    } else if (senha.length < 7) {
                      return 'Senha mínima com 7 caracteres';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (pass) => user.confirmPassword = pass,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: () {
                      if (formkey.currentState.validate()) {
                        // save chama o metodo onSave de cada um dos forms
                        formkey.currentState.save();
                        if (user.senha != user.confirmPassword) {
                          scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Senhas são diferentes!'),
                              backgroundColor: Colors.redAccent,
                              duration: Duration(seconds: 7),
                            ),
                          );
                          return;
                        }
                        //usermanager

                        context.read<UserManager>().signUp(
                              user: user,
                              onSuccess: () {
                                debugPrint('Sucesso debug print');
                                Navigator.of(context).pop();
                              },
                              onFail: (e) {
                                scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text('Falha ao cadastrar: $e'),
                                    backgroundColor: Colors.redAccent,
                                    duration: Duration(seconds: 7),
                                  ),
                                );
                              },
                            );
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    disabledColor:
                        Theme.of(context).primaryColor.withAlpha(100),
                    textColor: Colors.white,
                    child: const Text('Criar Conta',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
