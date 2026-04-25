import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Stream of [auth.User?] which emits the current user when the auth state changes.
  /// Use this to reactively update the UI based on login status.
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Gets the currently signed-in user.
  User? get currentUser => _firebaseAuth.currentUser;

  /// Signs in the user with email and password.
  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
      return null;
    }
  }

  /// Creates a new user account.
  Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
      return null;
    }
  }

  /// Signs out the current user.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// Password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
    }
  }

  /// Helper to map Firebase errors to readable messages (or handle them in the UI)
  void _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        if (kDebugMode) {
          print('No user found for that email.');
        }
        break;
      case 'wrong-password':
        if (kDebugMode) {
          print('Wrong password provided.');
        }
        break;
      case 'email-already-in-use':
        if (kDebugMode) {
          print('The email is already in use by another account.');
        }
        break;
      default:
        if (kDebugMode) {
          print('Firebase Auth Error: ${e.message}');
        }
    }
  }
}