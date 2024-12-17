import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthenticationRepository {
  final authInstance = FirebaseAuth.instance;
  Stream<User?> get onAuthStateChanged => authInstance.authStateChanges();

  /// Login
  Future<void> loginUser(String email, String password);

  /// Logout
  Future<void> logoutUser();

  /// SignUp
  Future<void> signUp(String email, String password);

  /// Reset Password
  Future<void> resetPassword(String email);

  /// Login with Google
  Future<dynamic> signInWithGoogle();

  /// Login with Google
  Future<bool> signOutFromGoogle();
}
