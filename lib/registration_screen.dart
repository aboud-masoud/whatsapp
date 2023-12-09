import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/main_view.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  TextEditingController confirmPasswordField = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset("assets/images.jpeg"),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(
                  prefix: Icon(Icons.email),
                  hintText: "email",
                ),
                controller: emailField,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(
                  prefix: Icon(Icons.password),
                  hintText: "password",
                ),
                controller: passwordField,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(
                  prefix: Icon(Icons.password),
                  hintText: "confirm password",
                ),
                controller: confirmPasswordField,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 32,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (emailField.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("email is empty"),
                      ),
                    );
                  } else if (passwordField.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("password is empty"),
                      ),
                    );
                  } else if (passwordField.text != confirmPasswordField.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("password not equial confirm password"),
                      ),
                    );
                  } else {
                    UserCredential? register;
                    try {
                      register = await auth
                          .createUserWithEmailAndPassword(email: emailField.text, password: passwordField.text)
                          .whenComplete(
                            () => ScaffoldMessenger.of(context)
                                .showSnackBar(
                                  const SnackBar(
                                    content: Text("Successfully Signed Up"),
                                  ),
                                )
                                .closed
                                .whenComplete(
                                  () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainView(),
                                    ),
                                  ),
                                ),
                          );
                    } catch (e) {
                      final error = e as FirebaseAuthException;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error.message!),
                        ),
                      );
                    }
                  }
                },
                child: const Text("Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
