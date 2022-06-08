import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sender/data/cubits/firebase_auth/firebase_auth_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirebaseAuthCubit, FirebaseAuthState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.when(
                authenticated: (user) => user.displayName ?? user.uid,
                unauthenticated: () => 'No user loaded.',
              ),
            ),
          ],
        );
      },
    );
  }
}
