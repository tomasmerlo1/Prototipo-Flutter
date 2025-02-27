import 'package:flutter/material.dart';
import 'package:aplication_noticias/services/weather_api.dart';
import 'package:aplication_noticias/services/news_api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    _newsData = _newsApi.fetchTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWeatherWidget(),
            const SizedBox(height: 20),
            _buildNewsCarousel(),
            const SizedBox(height: 20),
            _buildQuickSummary(),
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
          return const Align(
            alignment: Alignment.topRight,
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Align(
            alignment: Alignment.topRight,
            child: Text('Error al obtener clima'),
          );
        } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!['current'] == null || snapshot.data!['current']['condition'] == null) {
          return const Align(
            alignment: Alignment.topRight,
            child: Text('Datos de clima no disponibles'),
          );
        } else {
          final data = snapshot.data!;
          final temp = data['current']['temp_c'];
          final condition = data['current']['condition']['text'] ?? 'Desconocido';
          final iconUrl = data['current']['condition']['icon'] != null ? 'https:${data['current']['condition']['icon']}' : '';

          return Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconUrl.isNotEmpty)
                  CachedNetworkImage(
                    imageUrl: iconUrl,
                    width: 50,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                  ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('$temp°C', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(condition, style: const TextStyle(fontSize: 16)),
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
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error al obtener noticias'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No hay datos de noticias'));
        } else {
          final newsList = snapshot.data!;
          return CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: newsList.map((news) {
              String imageUrl = news['image'] ?? '';
              final title = news['title'] ?? 'Sin título';

              print('Carousel Image URL: $imageUrl'); // Imprime la URL

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
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) {
                            print('Error loading image: $url - $error'); // Imprime el error
                            return Image.asset('images/ultimo.png'); // Placeholder local
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Text(
                          title,
                          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
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
        const Text('Resumen rápido', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        FutureBuilder<List<Map<String, dynamic>>>(
          future: _newsData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error al obtener noticias'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('No hay datos de noticias'));
            } else {
              final newsList = snapshot.data!;
              return Column(
                children: newsList.take(3).map((news) {
                  String imageUrl = news['image'] ?? '';
                  final title = news['title'] ?? 'Sin título';
                  final source = news['source'] ?? 'Fuente desconocida';

                  print('Summary Image URL: $imageUrl'); // Imprime la URL

                  return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) {
                        print('Error loading image: $url - $error'); // Imprime el error
                        return Image.asset('images/ultimo.png'); // Placeholder local
                      },
                    ),
                    title: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
                    subtitle: Text(source),
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