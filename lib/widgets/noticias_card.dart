import 'package:flutter/material.dart';
import 'package:aplication_noticias/models/noticias_model.dart';

class NoticiasCard extends StatelessWidget {
  final Noticias noticia;

  const NoticiasCard({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row( // Usamos Row para alinear imagen y texto
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos en la parte superior
          children: [
            if (noticia.imagen != null && noticia.imagen.isNotEmpty) // Imagen si está disponible
              Padding(
                padding: const EdgeInsets.only(right: 8.0), // Espacio entre imagen y texto
                child: Image.network(
                  noticia.imagen,
                  width: 80, // Ajusta el ancho de la imagen
                  height: 80, // Ajusta la altura de la imagen
                  fit: BoxFit.cover,
                ),
              ),
            Expanded( // Expande el texto para ocupar el espacio restante
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noticia.titulo,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  if (noticia.descripcion != null && noticia.descripcion.isNotEmpty)
                    Text(
                      noticia.descripcion,
                      style: TextStyle(fontSize: 14),
                    ),
                  SizedBox(height: 4),
                  if (noticia.autor != null && noticia.autor.isNotEmpty)
                    Text('Autor: ${noticia.autor}', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  if (noticia.fecha != null && noticia.fecha.isNotEmpty)
                    Text('Fecha: ${noticia.fecha}', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  if (noticia.categoria != null)
                    Text('Categoría: ${noticia.categoria is List ? noticia.categoria.join(', ') : noticia.categoria.toString()}', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}