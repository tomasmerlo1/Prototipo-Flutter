import 'package:aplication_noticias/screens/noticias_model.dart';
import 'package:flutter/material.dart';
import 'package:aplication_noticias/screens/noticias_detalle_screen.dart';

class ListViewScreen extends StatelessWidget {
  final List<Noticias> noticiasList = [
    Noticias(
      titulo:
          "Olimpo de Bahía Blanca estimó pérdidas millonarias por el temporal.",
      descripcion:
          "El inclemente fenómeno climático causó destrozos en las instalaciones de los 'aurinegros' el pasado 16 de diciembre.",
      contenidototal:
          "El temporal que afectó a Bahía Blanca y zonas aledañas el pasado 16 de diciembre provocó destrozos por “al menos 68 millones de pesos” en Olimpo, según dio a conocer en un comunicado la institución aurinegra del sur de la provincia de Buenos Aires. A través de sus redes la entidad detalló los daños que sufrió el club y las cifras que estiman requerirán para normalizar la situación, en la que señala que el sector más afectado es el natatorio de calle Rodríguez, cuya “restauración total del techo y los vidrios se presupuestó en 30 millones de pesos”. Además notificaron que ya comenzaron con las refacciones. El fenómeno climático causó, entre otros daños, la rotura de un paredón, una pantalla gigante, paredes y cielorrasos de cabinas del estadio 'Roberto Carminatti' de Avenida Colón y Ángel Brunel, roturas en el techo y de vidrios de su natatorio, así como otros inconvenientes en los predios de la calle Don Bosco y Bottoni.",
      imagen: "imagenes/noticia_clubOlimpo.jpg",
    ),
    Noticias(
      titulo: "La era Milei.",
      descripcion:
          "Milei volará a la Antártida para iniciar un programa de control de contaminación.",
      contenidototal:
          "Se trata de un proyecto del Organismo Internacional de Energía Atómica, que dirige el diplomático argentino Rafael Grossi, quien acompañará al jefe de Estado en su viaje del 5 de enero al continente blanco.",
      imagen: "imagenes/noticia2.jpg",
    ),
    Noticias(
      titulo:
          "Continúa hoy el plan municipal de fumigación: revisá el cronograma.",
      descripcion:
          "El Municipio informó que tras una breve interrupción durante el domingo, continuarán hoy, primer día de 2024, las tareas de fumigación en nuestra ciudad.",
      contenidototal:
          "Este lunes trabajarán en El Maitén, La Cañada, Las Calandrias, Parque Norte, Carrindanga, Las Cañitas, Nueva Aldea y General Daniel Cerri, entre otros sectores.",
      imagen: "imagenes/noticia3.jpg",
    ),
    Noticias(
      titulo:
          "Operativos de Año Nuevo: 29 autos secuestrados y 12 aprehendidos en Rosario y Cuyo.",
      descripcion:
          "Así transcurrieron los primeras horas de 2024 según informaron desde la Agencia de Seguridad municipal.",
      contenidototal:
          "Autoridades de la Agencia de Seguridad, Emergencias y Respuesta Inmediata del Municipio informaron esta mañana cómo se desarrollaron los controles de tránsito y fiscalización en distintos puntos de la ciudad con motivo de la celebración del Año Nuevo. En ese sentido, comunicaron que --hasta las 7.50-- se realizaron 305 controles preventivos y se constataron 20 alcoholemias positivas. En total, fueron retenidos 29 vehículos (autos y motos) por diferentes motivos.",
      imagen: "imagenes/noticia4.jpg",
    ),
    Noticias(
      titulo: "El récord climático que rompió la Argentina durante 2023.",
      descripcion:
          "Bahía estuvo entre los puntos más cálidos del país el año pasado.",
      contenidototal:
          "Muy caliente y con una cantidad nunca antes registrada de olas de calor. Así terminó Argentina el año 2023 según datos suministrados por el Servicio Meteorológico Nacional, cuyo informe preliminar establece que la temperatura media para el conjunto del territorio nacional estuvo 0,96 grados centígrados por encima del período de referencia, que se calcula de manera sistematizada desde el año 1961.",
      imagen: "imagenes/noticia5.jpg",
    ),
    Noticias(
      titulo: "Detienen a un hombre que mordió a su pareja.",
      descripcion: "La víctima declaró en la Comisaría de la Mujer.",
      contenidototal:
          "Un hombre de 33 años fue detenido este lunes luego de que agrediera a su pareja, una mujer de 41 años, un hecho de violencia de género ocurrido en Sayhueque al 600.",
      imagen: "imagenes/noticia6.jpg",
    ),
    Noticias(
      titulo:
          "Anses: calendario de pagos para jubilados, beneficiarios de AUH y planes sociales.",
      descripcion:
          "El organismo previsional informó cuándo estarán disponibles los haberes para cada universo. Sigue el bono de hasta 55 mil para jubilaciones y rige el aumento de la AUH.",
      contenidototal:
          "La Administración Nacional de la Seguridad Social (Anses) comunicó el calendario de pagos de enero 2024 para jubilados, pensionados, beneficiarios de Pensiones No Contributivas y titulares de la Asignación Universal por Hijo, la Asignación por Embarazo, Asignaciones Familiares, de Pago Único (Matrimonio, Nacimiento y Adopción) y Prestación por Desempleo. En este marco, el gobierno comunicó que continuarán para las jubilaciones y pensiones el cobro del refuerzo de 55 mil pesos que comenzó a pagarse en diciembre sobre el incremento de 20,87% del mes pasado que arrojó la fórmula de la Ley de Movilidad. Por otro lado, los beneficiarios de la AUH percibirán el incremento del 100% y del 50% en la Tarjeta Alimentar.",
      imagen: "imagenes/noticia7.jpg",
    ),
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
                  style:
                      TextStyle(color: const Color.fromARGB(255, 12, 50, 82)),
                ),
                subtitle: Text(
                  noticia.descripcion,
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NoticiaDetalleScreen(noticia: noticia),
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
