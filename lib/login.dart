import 'package:flutter/material.dart';
import 'user.dart';

// Define a custom Form widget.
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _LoginState extends State<Login> {
  final _login = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    super.dispose();
  }

  _onLogin() {

    if (_login.text == "csguth" && _password.text == "123456789") {
      User().username = "csguth";
    } else if (_login.text == "ligiavieceli" && _password.text == "123456789") {
      User().username = "ligiavieceli";
    } else {
      return;
    }
    Navigator.pushNamed(context, '/home');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextFormField(
            controller: _login,
            onFieldSubmitted: (x) => {
              _onLogin()
          }),
          TextFormField(
            controller: _password,
            obscureText: true,
            onFieldSubmitted: (x) => {
              _onLogin()
          }),
          ElevatedButton(
            onPressed: _onLogin,
            child: const Text("Sign in"),
          )
        ]),
      ),
    );
  }
}


