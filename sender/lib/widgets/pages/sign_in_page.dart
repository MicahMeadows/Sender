import 'package:flutter/material.dart';
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/main.dart';
import 'package:sender/widgets/common/floating_text_field.dart';
import 'package:sender/widgets/common/thick_button.dart';
import 'package:sender/common/constants/colors.dart' as col;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();

  String get _emailText => emailController.text.trim();

  String get _passwordText => passwordController.text.trim();

  String get _nameText => nameController.text.trim();

  bool signIn = true;

  final signInTop = SizedBox(
    // color: Colors.white,
    width: double.infinity,
    child: Image.asset(
      'assets/images/sender_header_logo.png',
      height: 50,
    ),
  );

  final registerTop = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: const Column(
      children: [
        Text(
          'Welcome to Sender',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
        Text(
          "Let's get you setup with an account",
          textAlign: TextAlign.center,
          style: TextStyle(color: col.text2),
        ),
      ],
    ),
  );

  Widget getTopSection() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: signIn ? signInTop : registerTop,
    );
  }

  Widget getLoginBottom(FirebaseAuthCubit authCubit) {
    return Column(children: [
      const SizedBox(height: 23),
      ThickButton(
        text: 'Sign In',
        onPressed: () {
          authCubit.signIn(_emailText, _passwordText);
        },
      ),
      const SizedBox(height: 15),
      InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          setState(() {
            signIn = false;
          });
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
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
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<FirebaseAuthCubit>();
    return Scaffold(
      backgroundColor: col.background,
      body: Stack(
        children: [
          Positioned(
            left: 30,
            top: 30,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: signIn ? 0 : 1,
              child: ThickButton(
                mainColor: col.primary,
                overrideWidget: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: col.text2,
                ),
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    signIn = true;
                  });
                },
                height: 50,
                width: 50,
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: signIn ? 0 : 1,
              child: ThickButton(
                mainColor: col.accent,
                overrideWidget: const Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: Colors.white,
                ),
                padding: EdgeInsets.zero,
                onPressed: () {
                  firebaseAuthCubit.signUp(
                    email: _emailText,
                    password: _passwordText,
                    name: _nameText,
                  );
                },
                height: 50,
                width: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getTopSection(),
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
                  const SizedBox(height: 14),
                  AnimatedSize(
                    alignment: Alignment.bottomCenter,
                    duration: const Duration(milliseconds: 300),
                    reverseDuration: const Duration(milliseconds: 300),
                    child: SizedBox(
                      height: signIn ? 0 : null,
                      child: FloatingTextField(
                        controller: nameController,
                        hintText: 'Name',
                      ),
                    ),
                  ),
                  AnimatedSize(
                    alignment: Alignment.bottomCenter,
                    duration: const Duration(milliseconds: 350),
                    reverseDuration: const Duration(milliseconds: 350),
                    child: SizedBox(
                      height: signIn ? null : 0,
                      child: getLoginBottom(authCubit),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
