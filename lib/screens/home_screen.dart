import 'package:flutter/material.dart';
import 'package:aplication_noticias/services/weather_api.dart';
import 'package:aplication_noticias/services/news_api.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherApi _weatherApi = WeatherApi();
  final NewsApi _newsApi = NewsApi(); 

  late Future<Map<String, dynamic>> _weatherData;
  late Future<List<Map<String, dynamic>>> _newsData;

  @override
  void initState() {
    super.initState();
    _weatherData = _weatherApi.fetchWeather('Buenos Aires');
    _newsData = _newsApi.fetchTopNews(); // 🔹 Corregido, ahora usa _newsApi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWeatherWidget(), // Clima en la parte superior derecha
            const SizedBox(height: 20),
            _buildNewsCarousel(), // Carrusel de noticias destacadas
            const SizedBox(height: 20),
            _buildQuickSummary(), // Sección de resumen rápido
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherWidget() {
    return FutureBuilder<Map<String, dynamic>>(
      future: _weatherData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Align(
            alignment: Alignment.topRight,
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Align(
            alignment: Alignment.topRight,
            child: Text('Error al obtener clima'),
          );
        } else {
          final data = snapshot.data!;
          final temp = data['current']['temp_c'];
          final condition = data['current']['condition']['text'];
          final iconUrl = 'https:${data['current']['condition']['icon']}';

          return Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(iconUrl, width: 50),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('$temp°C', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(condition, style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildNewsCarousel() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _newsData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error al obtener noticias'));
        } else {
          final newsList = snapshot.data!;
          return CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: newsList.map((news) {
              return GestureDetector(
                onTap: () {
                  // Navegar a pantalla de detalles de la noticia
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          news['imageUrl'],
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Text(
                          news['title'],
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }

  Widget _buildQuickSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Resumen rápido', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        FutureBuilder<List<Map<String, dynamic>>>(
          future: _newsData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error al obtener noticias'));
            } else {
              final newsList = snapshot.data!;
              return Column(
                children: newsList.take(3).map((news) {
                  return ListTile(
                    leading: Image.network(news['imageUrl'], width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(news['title'], maxLines: 2, overflow: TextOverflow.ellipsis),
                    subtitle: Text(news['source']),
                    onTap: () {
                      // Navegar a pantalla de detalles
                    },
                  );
                }).toList(),
              );
            }
          },
        ),
      ],
    );
  }
}


