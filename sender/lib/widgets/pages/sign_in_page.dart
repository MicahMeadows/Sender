import 'package:flutter/material.dart';
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/widgets/common/floating_text_field.dart';
import 'package:sender/widgets/common/thick_button.dart';
import 'package:sender/common/constants/colors.dart' as col;

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
      backgroundColor: col.background,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // color: Colors.white,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/sender_header_logo.png',
                  height: 50,
                ),
              ),
              const SizedBox(height: 44),
              FloatingTextField(
                controller: emailController,
                hintText: 'Email',
              ),
              const SizedBox(height: 14),
              FloatingTextField(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password',
              ),
              const SizedBox(height: 23),
              ThickButton(
                  text: 'Sign In',
                  onPressed: () {
                    authCubit.signIn(_emailText, _passwordText);
                  }),
              const SizedBox(height: 15),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Need an account?',
                        style: TextStyle(fontSize: 18, height: 1),
                      ),
                      Text(
                        'Register now',
                        style: TextStyle(
                          fontSize: 18,
                          height: 1,
                          color: col.accent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ElevatedButton(
              //   onPressed: () async {
              //     try {
              //       await authCubit.signUp(
              //         email: _emailText,
              //         password: _passwordText,
              //         name: 'replace name',
              //       );
              //     } catch (e) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(content: Text("Failed to register")),
              //       );
              //     }
              //   },
              //   child: const Text("Register"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
