import 'dart:developer' as dev;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/firebase_authentication_repository.dart';

class LoginFirebase implements FirebaseAuthenticationRepository {
  @override
  final authInstance = FirebaseAuth.instance;
  @override
  Stream<User?> get onAuthStateChanged => authInstance.authStateChanges();

  /// Login
  @override
  Future<void> loginUser(String email, String password) async {
    try {
      await authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      dev.log("Login error: $e");
      throw Exception("Error during login: $e");
    }
  }

  /// Logout
  @override
  Future<void> logoutUser() async {
    try {
      await authInstance.signOut();
    } catch (e) {
      dev.log("Logout error: $e");
    }
  }

  /// SignUp
  @override
  Future<void> createUser(String email, String password) async {
    try {
      await authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      dev.log("SignUp error: $e");
    }
  }

  /// Reset Password
  @override
  Future<void> resetPassword(String email) async {
    try {
      await authInstance.sendPasswordResetEmail(email: email);
      dev.log("Password reset email sent to $email");
    } catch (e) {
      dev.log("Reset password error: $e");
    }
  }

  @override
  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        dev.log("User cancelled authorization");
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await authInstance.signInWithCredential(credential);
    } on Exception catch (e) {
      dev.log("Google sign-in error: $e");
    }
  }

  @override
  Future<void> signOutFromGoogle() async {
    try {
      await GoogleSignIn().signOut();
      await authInstance.signOut();
    } on Exception catch (e) {
      dev.log("Google sign-out error: $e");
    }
  }
}
