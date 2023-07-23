import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  final Function(String, String) onSubmitted;
  const Login({super.key, required this.onSubmitted});

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final _login = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    super.dispose();
  }

  _onLogin() async{
    widget.onSubmitted(_login.text, _password.text);
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


