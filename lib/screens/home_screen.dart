import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Agrega la imagen
          Image.asset(
            'assets/imagenes/noticiero.jpg', 
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          // Agrega el título
          Text(
            'BAHIA NOTICIAS',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          // Agrega la breve descripción
          Text(
            'Enterate de todas las noticias del dia a dia en Bahia Blanca',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
),
        SizedBox(height: 16),
          // Contenido original
          const Center(
            child: Text('Widget Original'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('hice click en el boton');
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
