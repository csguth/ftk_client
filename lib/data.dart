import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class Database {

  static final Database _instance = Database._internal();

  factory Database() {
    return _instance;
  }

  Database._internal();


  init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAuth.instance.useAuthEmulator('127.0.0.1', 9099);
  }
}