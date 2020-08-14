import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_final_cards/controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthController _authController;
  ReactionDisposer _disposer;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _authController = Provider.of<AuthController>(context);
    _disposer = autorun((_) {
      if (_authController.loginResult != null &&
          !_authController.loginResult.status) {
        _key.currentState
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(
              _authController.loginResult.message?.toString() ??
                  'Erro Indefido',
              style: TextStyle(color: Theme.of(context).colorScheme.onError),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.onError,
          ));
      }
    });
  }

  void _signin() async {
    _authController.signIn(
        email: _emailController.text, password: _passwordController.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
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
            OutlineButton(
              onPressed: _signin,
              child: Text('Entrar'),
            )
          ],
        )),
      ),
    );
  }
}
