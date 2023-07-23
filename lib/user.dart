import 'package:shared_preferences/shared_preferences.dart';

class User {

  static final User _instance = User._internal();

  factory User() {
    return _instance;
  }

  User._internal();

  late SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get username {
    return _prefs.getString('username') ?? '';
  }

  set username(String value) {
    _prefs.setString('username', value);
  }




}