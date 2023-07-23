import 'package:flutter/material.dart';

import 'user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  String _username = "";

  @override
  void initState() {
    super.initState();
    _username = User().username;    
  }

  void _handleLogout() {
      User().username = "";
      setState(() {
        _username = User().username;
      });
      
      Navigator.popUntil(context, ModalRoute.withName('/login'));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, $_username"),
        automaticallyImplyLeading: false
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  <Widget>[
          ElevatedButton(
            onPressed: _handleLogout,
            child: const Text("Sign out"),
          ),
        ],
      ),
    );
  }
}