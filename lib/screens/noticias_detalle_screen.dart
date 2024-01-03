import 'package:aplication_noticias/screens/noticias_model.dart';
import 'package:flutter/material.dart';

class NoticiaDetalleScreen extends StatelessWidget {
  final Noticias noticia;

  NoticiaDetalleScreen({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noticia.titulo),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(noticia.imagen),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 26.0, left: 16.0, right: 16.0, bottom: 16.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(223, 255, 255, 255),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  noticia.contenidototal,
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  width: 380,
                  height: 220,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      noticia.imagen,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
Widget _buildAlternativo(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
        title: Text(noticia.titulo),
      ),
    body: Container(
      // ... el resto de tu código ...
      child: Center(
        child: Container(
          // ... el resto de tu código ...
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ... el resto de tu código ...
              ElevatedButton(
                onPressed: () {
                  // Aquí se ejecutará la acción al presionar el botón
                 Navigator.pushNamed(context, '/noticias_model');
                },
                child: Text('Noticias del día'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

}
