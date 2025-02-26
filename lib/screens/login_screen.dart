import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aplication_noticias/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  Future<void> _register() async {
    try {
      List<String> signInMethods = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(_emailController.text.trim());
      if (signInMethods.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Este correo ya está registrado. Por favor, inicia sesión.')),
        );
        return;
      }
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _contrasenaController.text.trim(),
      );
      print("Usuario registrado: ${userCredential.user!.email}");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userEmail', userCredential.user!.email!);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen(initialIndex: 0)),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('La contraseña es demasiado débil.');
      } else if (e.code == 'email-already-in-use') {
        print('La cuenta ya existe para ese correo electrónico.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Este correo ya está registrado.')),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _contrasenaController.text.trim(),
      );
      print("Usuario iniciado sesión: ${userCredential.user!.email}");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userEmail', userCredential.user!.email!);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen(initialIndex: 0)),
      );
    } on FirebaseAuthException catch (e) {
      // Manejo de errores de inicio de sesión
      print("Error de inicio de sesión: ${e.code}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al iniciar sesión. Verifica tus credenciales.')),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> _resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Se ha enviado un correo de restablecimiento de contraseña.')),
      );
    } on FirebaseAuthException catch (e) {
      // Manejo de errores
      print("Error al restablecer la contraseña: ${e.code}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al restablecer la contraseña. Verifica el correo.')),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro/Inicio de Sesión"),
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
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _login,
              child: Text("Iniciar Sesión"),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _resetPassword,
              child: Text("¿Olvidaste tu contraseña?"),
            ),
          ],
        ),
      ),
    );
  }
}