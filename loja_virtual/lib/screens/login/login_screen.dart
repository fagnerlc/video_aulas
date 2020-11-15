import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
        actions: [
          FlatButton(
            onPressed: () {
              // pushReplacementNamed substitui uma tela por outra
              Navigator.of(context).pushReplacementNamed('/signup');
            },
            child: Text('CRIAR CONTA'),
            textColor: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: formkey,
                child: Consumer<UserManager>(
                  builder: (_, userManager, __) {
                    return ListView(
                      // shrinkWrap = ocupa a menor altura possível
                      shrinkWrap: true,
                      children: [
                        TextFormField(
                          controller: emailController,
                          enabled: !userManager.loading,
                          decoration: const InputDecoration(hintText: 'E-mail'),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          validator: (email) {
                            if (!emailValid(email)) {
                              return 'E-mail inválido';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: senhaController,
                          enabled: !userManager.loading,
                          decoration: const InputDecoration(hintText: 'Senha'),
                          autocorrect: false,
                          obscureText: true,
                          validator: (senha) {
                            if (senha.isEmpty || senha.length < 7) {
                              return 'Senha inválida';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            child: const Text(
                              'Esqueci minha senha',
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 44,
                          child: RaisedButton(
                            onPressed: userManager.loading
                                ? null
                                : () {
                                    if (formkey.currentState.validate()) {
                                      //context.read<UserManager>().signIn(
                                      userManager.signIn(
                                        user: User(
                                          email: emailController.text,
                                          senha: senhaController.text,
                                        ),
                                        //CallBack passa como parametro uma função anonima que chama a de dentro
                                        onFail: (e) {
                                          scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                              content:
                                                  Text('Falha ao entrar: $e'),
                                              backgroundColor: Colors.redAccent,
                                              duration: Duration(seconds: 7),
                                            ),
                                          );
                                        },
                                        onSuccess: () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    } else {}
                                  },
                            color: Theme.of(context).primaryColor,
                            disabledColor:
                                Theme.of(context).primaryColor.withAlpha(100),
                            textColor: Colors.white,
                            child: userManager.loading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : const Text('Entrar',
                                    style: TextStyle(
                                      fontSize: 18,
                                    )),
                          ),
                        ),
                      ],
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
