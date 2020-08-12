import 'package:dio/dio.dart';
import 'package:trabalho_final_cards/models/login.dart';

abstract class APICardsHelper {
  static Dio getDioInstance({LoginState loginState}) {
    return Dio(BaseOptions(
      baseUrl: 'https://api-cards-growdev.herokuapp.com',
      headers: _defaultHeaders(loginState: loginState),
    ));
  }

  static Map<String, dynamic> _defaultHeaders({LoginState loginState}) {
    final Map<String, dynamic> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (loginState?.token?.isNotEmpty ?? false) {
      header.addAll({'Authorization': 'Token ${loginState.token}'});
    }
    return header;
  }
}
