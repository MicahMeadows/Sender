import 'package:flutter/material.dart';
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignInPage({Key? key}) : super(key: key);

  String get _emailText => emailController.text.trim();
  String get _passwordText => passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<FirebaseAuthCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            children: [
              const Text("Email"),
              TextField(controller: emailController),
              const Text("Password"),
              TextField(controller: passwordController),
              ElevatedButton(
                onPressed: () {
                  authCubit.signIn(_emailText, _passwordText);
                },
                child: const Text("Sign In"),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await authCubit.signUp(_emailText, _passwordText);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Failed to register")),
                    );
                  }
                },
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
