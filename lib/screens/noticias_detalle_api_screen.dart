import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiaDetalleApiScreen extends StatelessWidget {
  final Map<String, dynamic> noticia;

  NoticiaDetalleApiScreen({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noticia['title'] ?? 'Sin título'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (noticia['image'] != null)
              Image.network(
                noticia['image'],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16.0),
            Text(
              noticia['title'] ?? 'Sin título',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              noticia['description'] ?? 'Sin descripción',
              style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16.0),
            Text('Autor: ${noticia['author'] ?? 'Desconocido'}'),
            Text('Fecha: ${noticia['published_at'] ?? 'Sin fecha'}'),
            Text('Categoría: ${noticia['category'] is List ? noticia['category'].join(', ') : noticia['category'] ?? 'Sin categoría'}'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final url = noticia['url'];
                if (url != null && await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No se pudo abrir la noticia')));
                }
              },
              child: Text('Leer Noticia Completa'),
            ),
          ],
        ),
      ),
    );
  }
}