import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if(username == 'admin' && password == 'admin') {
      _isAuthenticated = true;
      notifyListeners();
    } else {
      throw Exception('Invalid username or password');
    }    
  }
}