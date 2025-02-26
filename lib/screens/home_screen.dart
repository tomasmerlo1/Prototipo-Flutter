import 'package:flutter/material.dart';
import 'package:aplication_noticias/services/weather_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenClimaState createState() => _HomeScreenClimaState();
}

class _HomeScreenClimaState extends State<HomeScreen> {
  final WeatherApi _weatherApi = WeatherApi();
  late Future<Map<String, dynamic>> _weatherData;

  @override
  void initState() {
    super.initState();
    _weatherData = _weatherApi.fetchWeather('Buenos Aires'); // Puedes cambiar la ciudad
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clima')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _weatherData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            final temp = data['current']['temp_c']; // Temperatura en °C
            final condition = data['current']['condition']['text']; // Estado del clima
            final iconUrl = 'https:${data['current']['condition']['icon']}'; // Icono del clima

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(iconUrl, width: 100),
                  Text('$temp°C', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  Text(condition, style: TextStyle(fontSize: 20)),
                  Text('Ciudad: ${data['location']['name']}', style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
