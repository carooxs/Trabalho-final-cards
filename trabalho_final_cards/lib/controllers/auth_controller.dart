import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:trabalho_final_cards/services/login_repository.dart';
import 'package:trabalho_final_cards/services/login_service.dart';
import 'package:trabalho_final_cards/models/login.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;
abstract class _AuthControllerBase with Store {
  final LoginRepository _loginRepository;
  final _loginService = LoginService();

  _AuthControllerBase({@required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  @observable
  bool isLoading = true;
  @observable
  LoginState loginRepository;
  @observable
  Result<String> loginResult;

  @computed
  bool get isLogedIn => loginRepository != null;

  @action
  void getCurrent() {
    isLoading = true;
    _loginRepository
        .getCurrent()
        .then((value) => loginRepository = value)
        .whenComplete(() => isLoading = false);
  }

  @action
  void signIn({String email, String password}) {
    _loginService.signIn(email: email, password: password).then((value) {
      loginResult = value;
      getCurrent();
    });
  }

  @action
  Future<void> signOut() async {
    await _loginService.signOut();
    loginRepository = null;
  }
}
