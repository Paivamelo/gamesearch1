class User {
  String _email;
  String _senha;

  User() {
    _email = "";
    _senha = "";
  }

  User.fromMap(map) {
    this._email = map["email"];
    this._senha = map["senha"];
  }

  String get email => _email;
  String get senha => _senha;

  set email(String newEmail) {
    if (newEmail.length > 0) {
      this._email = newEmail;
    }
  }

  set senha(String newSenha) {
    if (newSenha.length > 0) {
      this._senha = newSenha;
    }
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["email"] = _email;
    map["senha"] = _senha;
    return map;
  }
}
