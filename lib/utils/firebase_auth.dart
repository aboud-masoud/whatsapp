import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyFirebaseAuth {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User?> createAccount(
      {required BuildContext context, required String email, required String password}) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      final error = e as FirebaseAuthException;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message!),
        ),
      );
      return null;
    }
  }

  static Future<User?> signIn({required BuildContext context, required String email, required String password}) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);

      return result.user;
    } catch (e) {
      final error = e as FirebaseAuthException;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message!),
        ),
      );
      return null;
    }
  }
}
