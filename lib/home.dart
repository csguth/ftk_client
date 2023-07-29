import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  final Function() onSignedOut;
  const Home({super.key, required this.onSignedOut});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _username = "";

  @override
  void initState() {
    super.initState();
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    _username = firebaseAuth.currentUser?.displayName ?? "";
    firebaseAuth.userChanges().listen((event) {
      if (event == null || event.isAnonymous) {
        widget.onSignedOut();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, $_username"),
        // automaticallyImplyLeading: false
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("$_username"),
            ),
            ListTile(
              title: const Text('Signout'),
              onTap: widget.onSignedOut,
            ),
          ],
        ),
      ),
    );
  }
}
