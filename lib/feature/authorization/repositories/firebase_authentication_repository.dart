import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthenticationRepository {
  final authInstance = FirebaseAuth.instance;

  Stream<User?> get onAuthStateChanged => authInstance.authStateChanges();

  /// createUser
  Future<void> createUser(String email, String password);

  /// Login
  Future<void> loginUser(String email, String password);

  /// Logout
  Future<void> logoutUser();

  /// Reset Password
  Future<void> resetPassword(String email);

  /// Update Password
  Future<void> updatePassword(String newPassword);

  /// Getting the current user
  Future<User?> getCurrentUser();

  /// Login with Google
  Future<dynamic> signInWithGoogle();

  /// Login with Google
  Future<void> signOutFromGoogle();

/*
 Für die zukunft  
 Email bestätigung -> sendEmailVerification()


*/
}
