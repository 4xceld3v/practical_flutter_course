import '../../../services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../counter/view/counter_view.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginViewModel(authService: AuthService()),
        child: Scaffold(
            appBar: AppBar(title: const Text('Login with Provider')),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                const SizedBox(height: 20),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      labelText: 'Username', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Consumer<LoginViewModel>(
                  builder: (context, loginViewModel, child) {
                    if (loginViewModel.isLoading) {
                      return const CircularProgressIndicator();
                    }

                    if (loginViewModel.error != null) {
                      return Text(loginViewModel.error!, 
                      style: const TextStyle(color: Colors.red));
                    }
                    return ElevatedButton(
                      onPressed: () async {
                        final isSuccess = await loginViewModel.login(_usernameController.text, _passwordController.text);
                        if (isSuccess) {
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) => const CounterView()));
                        }
                      },
                      child: const Text('Login'),
                    );
                  },
                )
              ]),
            )));
  }
}
