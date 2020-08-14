import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_final_cards/controllers/auth_controller.dart';
import 'package:trabalho_final_cards/pages/login/login_page.dart';
import 'package:trabalho_final_cards/services/login_repository.dart';
import 'package:trabalho_final_cards/utils/app_routes.dart';

void main() {
  return runApp(MultiProvider(providers: [
    Provider<AuthController>(
        create: (_) =>
            AuthController(loginRepository: LoginRepository())..getCurrent())
  ]));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final authController = Provider.of<AuthController>(context);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.LOGIN_PAGE,
      routes: {
        AppRoutes.HOME_PAGE: (context) {
          return Observer(
            builder: (context) {
              if (authController.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!authController.isLogedIn) {
                return LoginPage();
              }
              return HomePage();
            },
          );
        },
        AppRoutes.LOGIN_PAGE: (context) => LoginPage(),
      },
    );
  }
}
