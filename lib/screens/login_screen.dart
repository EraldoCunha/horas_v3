import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  FlutterLogo(size: 76),
                  SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    controller: _senhaController,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(onPressed: () {}, child: Text('Entrar'),),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {}, child: Text('Entrar com Google'),),
                  SizedBox(height: 16),
                  TextButton(onPressed: (){}, child: Text('Ainda não tem uma conta, crie uma conta'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
