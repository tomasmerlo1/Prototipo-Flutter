import 'package:aplication_noticias/screens/listviewregister_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INICIO"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'imagenes/noticiero.jpg',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 18),
            Text(
              'BAHIA NOTICIAS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Enterate de todas las noticias del día a día en Bahía Blanca',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navegar a la segunda pantalla al hacer clic en el botón
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewScreen()),
                );
              },
              child: Text('Ir a Noticias'),
            ),
          ],
        ),
      ),
    );
  }
}