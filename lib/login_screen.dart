import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whatsapp/chat_details_screen.dart';
import 'package:whatsapp/main_view.dart';
import 'package:whatsapp/registration_screen.dart';
import 'package:whatsapp/utils/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset("assets/images.jpeg"),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(prefix: Icon(Ionicons.mail)),
                controller: emailField,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(prefix: Icon(Icons.password)),
                controller: passwordField,
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                height: 50,
                child: ElevatedButton(
                    onPressed: () async {
                      final x = await MyFirebaseAuth.signIn(
                          context: context, email: emailField.text, password: passwordField.text);

                      if (x != null) {
                        userEmail = emailField.text;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainView(),
                          ),
                        );
                      }
                    },
                    child: const Text("Login"))),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return const RegistrationScreen();
                  }));
                },
                child: const Text("Registraion"))
          ],
        ),
      ),
    );
  }
}
