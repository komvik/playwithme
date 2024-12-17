import 'dart:developer' as dev;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/firebase_authentication_repository.dart';

class LoginRepository implements FirebaseAuthenticationRepository {
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
      dev.log("$e");
    }
  }

  /// Logout
  @override
  Future<void> logoutUser() async {
    try {
      await authInstance.signOut();
    } catch (e) {
      dev.log("$e");
    }
  }

  /// SignUp
  @override
  Future<void> signUp(String email, String password) async {
    try {
      await authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      dev.log("$e");
    }
  }

  /// Reset Password
  @override
  Future<void> resetPassword(String email) async {
    try {
      authInstance.sendPasswordResetEmail(email: email);
      dev.log("reset password sent to $email");
    } catch (e) {
      dev.log("$e");
    }
  }

  @override
  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await authInstance.signInWithCredential(credential);
    } on Exception catch (e) {
      dev.log('exception->$e');
    }
  }

  @override
  Future<bool> signOutFromGoogle() async {
    try {
      await GoogleSignIn().signOut();
      await authInstance.signOut();

      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
