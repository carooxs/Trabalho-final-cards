import 'package:flutter/material.dart';
import 'package:trabalho_final_cards/pages/login/login_page.dart';
import 'package:trabalho_final_cards/utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light() ,
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.LOGIN_PAGE,
      routes: {
        AppRoutes.LOGIN_PAGE: (context) => LoginPage(),
      }, 
    );
  }
}