import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'services/auth_service.dart';
import 'ui/counter/bloc/counter_bloc.dart';
import 'ui/login/view/login_screen.dart';
import 'ui/login/bloc/login_bloc.dart';

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>( create: (context) => LoginBloc(authService: authService)),
        BlocProvider(create: (context) => CounterBloc()),
      ], 
      child: MaterialApp(
        title: 'Flutter Bloc Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      )
    );
  }
}