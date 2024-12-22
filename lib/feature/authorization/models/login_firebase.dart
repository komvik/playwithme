import 'dart:developer' as dev;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projekt_481_play_with_me/feature/authorization/repositories/firebase_authentication_repository.dart';

class LoginFirebase implements FirebaseAuthenticationRepository {
  @override
  final authInstance = FirebaseAuth.instance;

  @override
  Stream<User?> get onAuthStateChanged => authInstance.authStateChanges();

  // 1 // ________Create user (sign up)
  @override
  Future<void> createUser(String email, String password) async {
    try {
      await authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      dev.log("SignUp error: $e");
      throw Exception("Error during sign up: $e");
    }
  }

  // 2 //___________Login
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

  // 3 //________ Logout
  @override
  Future<void> logoutUser() async {
    try {
      await authInstance.signOut();
    } catch (e) {
      dev.log("Logout error: $e");
    }
  }

  // 4 //________ Reset Password
  @override
  Future<void> resetPassword(String email) async {
    try {
      await authInstance.sendPasswordResetEmail(email: email);
      dev.log("Password reset email sent to $email");
    } catch (e) {
      dev.log("Reset password error: $e");
      throw Exception("Error during password reset: $e");
    }
  }

  // 5 // ________ Update Password
  @override
  Future<void> updatePassword(String newPassword) async {
    User? user = authInstance.currentUser;
    if (user != null) {
      try {
        await user.updatePassword(newPassword);
        dev.log("Password updated successfully.");
      } catch (e) {
        dev.log("Error updating password: $e");
        throw Exception("Error updating password: $e");
      }
    } else {
      dev.log("No user signed in.");
    }
  }

// 6 // _______ Getting the current user
  @override
  Future<User?> getCurrentUser() async {
    try {
      User? currentUser = authInstance.currentUser;
      if (currentUser == null) {
        dev.log("User is no signed in.");
      } else {
        dev.log("Current user signed in with email : ${currentUser.email}");
      }
      return currentUser;
    } catch (e) {
      dev.log("Error current user: $e");
      return null;
    }
  }

//
//______________G O O G L E _________
//
// logIn with Google
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

// logOut with Google
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
