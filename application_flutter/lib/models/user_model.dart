class User {
  String _username;
  String _password;

  String get username => _username;
  setUsername(String username) {
    _username = username;
  }

  String get password => _password;
  setPassword(String password) {
    _password = password;
  }

  User(this._username, this._password);
}
