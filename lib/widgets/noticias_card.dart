import 'package:flutter/material.dart';
import 'package:aplication_noticias/models/noticias_model.dart';

class NoticiasCard extends StatelessWidget {
  final Noticias noticia;

  const NoticiasCard({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (noticia.imagen.isNotEmpty)
              Center(
                child: Image.network( // Cambia Image.asset() a Image.network()
                  noticia.imagen,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: 8),
            Center(
              child: Text(
                noticia.titulo,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 4),
            Center(
              child: Text(
                noticia.descripcion,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            Text('Autor: ${noticia.autor ?? 'Desconocido'}'),
          ],
        ),
      ),
    );
  }
}