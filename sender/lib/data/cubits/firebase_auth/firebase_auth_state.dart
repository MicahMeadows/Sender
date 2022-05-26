part of 'firebase_auth_cubit.dart';

@freezed
class FirebaseAuthState with _$FirebaseAuthState {
  const factory FirebaseAuthState.authenticated(User user) = _authenticated;
  const factory FirebaseAuthState.unauthenticated() = _unauthenticated;
}
