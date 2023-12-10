import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyFirebaseAuth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential>? createAccount(
      {required BuildContext context, required String email, required String password}) {
    try {
      return auth.createUserWithEmailAndPassword(email: email, password: password);
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

  Future<User?> signIn({required BuildContext context, required String email, required String password}) async {
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
