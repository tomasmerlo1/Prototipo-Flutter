import 'package:flutter/material.dart';
import 'package:aplication_noticias/screens/listviewregister_screen.dart';
// ignore: unused_import
import 'package:aplication_noticias/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Demo',
      home: ListViewScreen(),
    );
  }
}
