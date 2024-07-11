import 'package:flutter/material.dart';
import 'package:aplication_noticias/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BAHIA NOTICIAS',
      home: HomeScreen(),
    );
  }
}
