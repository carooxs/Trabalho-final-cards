import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trabalho_final_cards/controllers/auth_controller.dart';
import 'package:trabalho_final_cards/models/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<ScaffoldState>();
  AuthController _authController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Observer(builder: (context) {
              var _user = User(
                  email: _authController.loginRepository.email,
                  name: _authController.loginRepository.email);
                  return UserAccountsDrawerHeader(accountName: Text(_user.name), accountEmail: Text(_user.email))
            })
          ],
        ),
      ),
    );
  }
}
