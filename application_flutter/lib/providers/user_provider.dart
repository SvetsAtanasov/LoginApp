import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';

const String endPoint =
    'https://login-app-d1603-default-rtdb.europe-west1.firebasedatabase.app/users.json';

Uri url = Uri.parse(endPoint);

class UserProvider with ChangeNotifier {
  var user = User('', '');

  List<String> list = [];

  void getItems() {
    for (int i = 0; i < 10; i++) {
      list.add('Test');
    }
    notifyListeners();
  }

  Future<void> registerUser() async {
    await http.post(
      url,
      body: json.encode({
        'username': user.username,
        'password': user.password,
      }),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    bool hasLoggedIn = false;
    final response = await http.get(url);
    var data = json.decode(response.body) as Map<String, dynamic>;

    data.forEach(
      (id, userData) {
        if (hasLoggedIn) return;

        if (user.username == userData['username'] &&
            user.password == userData['password']) {
          hasLoggedIn = true;
          user.setUsername(userData['username']);
          user.setPassword(userData['password']);

          Navigator.pushNamed(context, '/loggedIn');
        } else {
          print('Wrong Details');
        }
      },
    );
  }
}
