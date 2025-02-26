import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApi {
  final String _apiKey = '92506cef0cb18679bc9f7303c333bf51';
  final String _baseUrl = 'http://api.mediastack.com/v1/news';

  // Método que hace la solicitud a la API
  Future<List<dynamic>> fetchNews({String language = 'es', String country = 'ar'}) async {
    final url = Uri.parse('$_baseUrl?access_key=$_apiKey&languages=$language&countries=$country');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return json['data'] ?? [];
    } else {
      throw Exception('Error al cargar noticias: ${response.statusCode}');
    }
  }
}
