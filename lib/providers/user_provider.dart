import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  void signup(String name, String email, String password) {
    _currentUser = User(
      id: DateTime.now().toString(),
      name: name,
      email: email,
      password: password,
    );
    notifyListeners();
  }

  void login(String email, String password) {
    if (_currentUser != null &&
        _currentUser!.email == email &&
        _currentUser!.password == password) {
      notifyListeners();
    } else {
      throw Exception('Invalid email or password');
    }
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
