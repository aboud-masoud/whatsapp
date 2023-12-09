import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:whatsapp/registration_screen.dart';

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
        title: Text("Login"),
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
                child: ElevatedButton(onPressed: () {}, child: const Text("Login"))),
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
