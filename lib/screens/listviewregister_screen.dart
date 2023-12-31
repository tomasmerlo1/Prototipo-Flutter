import 'package:aplication_noticias/screens/noticias_model.dart';
import 'package:flutter/material.dart';
import 'package:aplication_noticias/screens/noticias_detalle_screen.dart';

class ListViewScreen extends StatelessWidget {
  final List<Noticias> noticiasList = [
    Noticias(
      titulo: "Olimpo de Bahía Blanca estimó pérdidas millonarias por el temporal",
      descripcion: "El inclemente fenómeno climático causó destrozos en las instalaciones de los 'aurinegros' el pasado 16 de diciembre",
      contenidototal: "El temporal que afectó a Bahía Blanca y zonas aledañas el pasado 16 de diciembre provocó destrozos por “al menos 68 millones de pesos” en Olimpo, según dio a conocer en un comunicado la institución aurinegra del sur de la provincia de Buenos Aires. A través de sus redes la entidad detalló los daños que sufrió el club y las cifras que estiman requerirán para normalizar la situación, en la que señala que el sector más afectado es el natatorio de calle Rodríguez, cuya “restauración total del techo y los vidrios se presupuestó en 30 millones de pesos”. Además notificaron que ya comenzaron con las refacciones. El fenómeno climático causó, entre otros daños, la rotura de un paredón, una pantalla gigante, paredes y cielorrasos de cabinas del estadio 'Roberto Carminatti' de Avenida Colón y Ángel Brunel, roturas en el techo y de vidrios de su natatorio, así como otros inconvenientes en los predios de la calle Don Bosco y Bottoni.",
      imagen: "imagenes/noticia_clubOlimpo.jpg",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias"),
        backgroundColor: Colors.white, 
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('imagenes/noticiero.jpg'),
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
                  style: TextStyle(color: const Color.fromARGB(255, 12, 50, 82)), 
                ),
                subtitle: Text(
                  noticia.descripcion,
                  style: TextStyle(color: Colors.blue), 
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoticiaDetalleScreen(noticia: noticia),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
