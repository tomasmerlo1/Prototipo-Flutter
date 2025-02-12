import 'dart:convert'; // Para convertir la respuesta JSON a un Map
import 'package:http/http.dart' as http; // Para hacer solicitudes HTTP

class NewsApi {
  final String _apiKey = '282cd54de7b44445a0bc119433a44355';
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines';

  // Método que hace la solicitud a la API
  Future<List<dynamic>> fetchNews({String country = 'us'}) async {
    final url = Uri.parse('$_baseUrl?country=$country&apiKey=$_apiKey');
    
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Decodifica la respuesta JSON
      final Map<String, dynamic> json = jsonDecode(response.body);
      return json['articles']; // Devuelve la lista de artículos
    } else {
      throw Exception('Error al cargar noticias');
    }
  }
}