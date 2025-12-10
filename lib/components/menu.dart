import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:horas_v3/services/auth_service.dart';

import '../screens/login_screen.dart';

class Menu extends StatelessWidget {
  final User user;
  const Menu({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.manage_accounts_rounded, size: 48),
            ),
            accountName: Text(
              (user.displayName != null) ? user.displayName! : '',
            ),
            accountEmail: Text(user.email!),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              AuthService().deslogar();
            },
          ),
          ListTile(
            leading: Icon(Icons.delete_forever, color: Colors.red),
            title: Text('Excluir conta', style: TextStyle(color: Colors.red)),
            onTap: () {
              final senhaController = TextEditingController();

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Excluir conta'),
                  content: TextField(
                    controller: senhaController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Senha'),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () async {
                        final erro = await AuthService().excluirConta(
                          senha: senhaController.text,
                        );

                        if (erro != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(erro),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                                (route) => false,
                          );
                        }
                      },
                      child: Text('Confirmar'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
