import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_auth_state.dart';
part 'firebase_auth_cubit.freezed.dart';

class FirebaseAuthCubit extends Cubit<FirebaseAuthState> {
  final FirebaseAuth firebaseAuth;
  FirebaseAuthCubit(this.firebaseAuth)
      : super(const FirebaseAuthState.unauthenticated()) {
    initialize();
  }

  void initialize() {
    firebaseAuth.authStateChanges().listen(onUserChange);
  }

  void onUserChange(User? user) {
    if (user == null) {
      emit(const FirebaseAuthState.unauthenticated());
      return;
    } else {
      emit(FirebaseAuthState.authenticated(user));
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }
}
