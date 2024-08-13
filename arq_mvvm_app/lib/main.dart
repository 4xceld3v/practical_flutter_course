import 'package:arq_mvvm_app/screens/login/view/login_view.dart';
import 'package:arq_mvvm_app/screens/login/viewmodel/login_viewmodel.dart';
import 'package:arq_mvvm_app/screens/counter/viewmodel/counter_viewmodel.dart';
import 'package:arq_mvvm_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel(authService: AuthService())),
        ChangeNotifierProvider(create: (_) => CounterViewModel())
      ],
      child:    MaterialApp(
      title: 'Flutter MVM Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: LoginView()
    ),
    );
    

  }
}
