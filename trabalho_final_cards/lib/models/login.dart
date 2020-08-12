class LoginState {
  int id;
  String email;
  String token;

  LoginState({this.id, this.token, this.email});

  LoginState.empty();

  LoginState.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    token = map['token'];
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'email': email, 'token': token};
  }
}
