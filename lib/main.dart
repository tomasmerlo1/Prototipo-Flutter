import 'package:flutter/material.dart';
import 'package:aplication_noticias/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBcgDMtUYqxPH8FdtoiP4dPbb8gYfJX-Ps",
      authDomain: "prototipo-flutter.firebaseapp.com",
      projectId: "prototipo-flutter",
      storageBucket: "prototipo-flutter.appspot.com",
      messagingSenderId: "706298610676",
      appId: "1:706298610676:web:06e39ff091280b04346fa1",
      measurementId: "G-M6MS6M5GJ8",
    ),
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NOTICIAS ARG',
      home: HomeScreen(),
    );
  }
}
