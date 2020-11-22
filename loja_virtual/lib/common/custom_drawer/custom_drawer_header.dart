import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
        height: 180,
        child: Consumer<UserManager>(
          // _ = Context, objeto = userManager, __ = child
          builder: (_, userManager, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Loja do \nFagner',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // ? a interrogação é para caso o user venha null ele nem chama o name
                // ?? se a expressão anterior for nula ele coloca vazio
                Text(
                  'Olá, ${userManager.user?.name ?? ''}',
                  //overflow quando o valor ultrapassar o tamanho da tela
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (userManager.isLoggedIn) {
                      userManager.signOut();
                    } else {
                      Navigator.of(context).pushNamed('/login');
                    }
                  },
                  child: Text(
                    userManager.isLoggedIn ? 'Sair' : 'Entre ou cadastre-se >',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
