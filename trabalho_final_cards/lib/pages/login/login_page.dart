import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: FlutterLogo(
                size: 150,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(child: Text('Para criar sua conta, Clique aqui')),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'e-mail',
              ),
              controller: _emailController,
            ),
             SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              controller: _passwordController,
              obscureText: true,
            ),
             SizedBox(
              height: 8,
            ),
            OutlineButton(onPressed:null, child: Text('Entrar') ,)
          ],
        )),
      ),
    );
  }
}
