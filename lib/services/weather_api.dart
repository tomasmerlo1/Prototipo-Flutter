import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  final String _apiKey = 'de508c7495ba430da92233402252602';
  final String _baseUrl = 'http://api.weatherapi.com/v1/current.json';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final url = Uri.parse('$_baseUrl?key=$_apiKey&q=$city&lang=es');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Devuelve los datos como un Map
    } else {
      throw Exception('Error al obtener el clima');
    }
  }
}
