import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    var user = provider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Form(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Username'),
              onChanged: (username) {
                user.setUsername(username);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (password) {
                user.setPassword(password);
              },
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<UserProvider>().registerUser();
                },
                child: const Text('Register'))
          ],
        ),
      ),
    );
  }
}
