import 'package:flutter/material.dart';

class NoticiaDetalleApiScreen extends StatelessWidget {
  final dynamic noticia;

  NoticiaDetalleApiScreen({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noticia['title'] ?? 'Detalle de la Noticia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (noticia['urlToImage'] != null)
              Image.network(noticia['urlToImage']),
            SizedBox(height: 16),
            Text(
              noticia['title'] ?? '',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(noticia['description'] ?? ''),
            SizedBox(height: 8),
            Text(noticia['content'] ?? ''),
          ],
        ),
      ),
    );
  }
}