import 'package:flutter/material.dart';

import 'login.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: LoginPage(),
      ),
    );
  }
}
