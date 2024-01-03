import 'package:flutter/material.dart';

class Noticias {
  final String titulo;
  final String descripcion;
  final String contenidototal;
  final String imagen;


  Noticias({
    required this.titulo,
    required this.descripcion,
    required this.contenidototal,
    required this.imagen,
  });
  final List<Noticias> noticiasList = [
  Noticias(
      titulo:
          "El decreto completo de Javier Milei: qué dicen los 366 artículos del DNU que firmó el Presidente para desregular la economía",
      descripcion:
          "'la crisis terminal que enfrenta la economía argentina y conjurar el grave riesgo de un deterioro aún mayor y mucho más grave de la situación social y económica'",
      contenidototal:
          "El decreto de necesidad y urgencia (DNU) que firmó Javier Milei incluye 366 artículos a lo largo de los cuales se derogan normativas como la Ley de Alquileres y la Ley de Abastecimiento. Además, libera el precio de las prepagas y habilita la privatización de empresas estatales, algunas de las 30 iniciativas que mencionó el Presidente en su mensaje en cadena nacional.",
      imagen: "imagenes/politica.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticia del Dia"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('imagenes/politica.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: ListView.builder(
          itemCount: noticiasList.length,
          itemBuilder: (context, index) {
            Noticias noticia = noticiasList[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  noticia.titulo,
                  style:
                      TextStyle(color: const Color.fromARGB(255, 12, 50, 82)),
                ),
                subtitle: Text(
                  noticia.descripcion,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

