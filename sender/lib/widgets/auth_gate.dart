import 'package:flutter/material.dart';
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/widgets/pages/main_navigation.dart';
import 'package:sender/widgets/pages/sign_in_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseAuthCubit, FirebaseAuthState>(
      builder: (context, state) {
        return state.when(
          authenticated: (user) => const MainNavigation(),
          unauthenticated: () => const SignInPage(),
        );
      },
    );
  }
}
