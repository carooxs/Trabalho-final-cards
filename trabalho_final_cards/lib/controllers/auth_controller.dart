import 'package:mobx/mobx.dart';
import 'package:trabalho_final_cards/services/login_repository.dart';
import 'package:trabalho_final_cards/services/login_service.dart';

class AuthController = _AuthControllerBase with _$AuthController;
abstract class _AuthController with Store {
  final LoginRepository _loginRepository;
  final _loginService = LoginService();

  _AuthControllerBase({@required LoginRepository loginRepository})
      : _loginRepository = loginRepository;

  @observable
  bool isLoading = true;
  @observable
  AppState appState;
  @observable
  Result<String> loginResult;

  @computed
  bool get isLogedIn => appState != null;

  @action
  void getCurrent() {
    isLoading = true;
    _appStateRepository
        .getCurrent()
        .then((value) => appState = value)
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
    appState = null;
  }
}
