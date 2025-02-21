import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
   _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

Future<void> _register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _contrasenaController.text.trim(),
      );
      print("Usuario registrado: ${userCredential.user!.email}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      print('La contraseña es demasiado débil.');
        } else if (e.code == 'email-already-in-use') {
      print('La cuenta ya existe para ese correo electrónico.');
}
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _contrasenaController,
              decoration: InputDecoration(labelText: "Contraseña"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }
}
