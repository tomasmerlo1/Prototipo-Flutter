import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApi {
<<<<<<< HEAD
  final String _apiKey = '9e4de6acaf1ea61c4c40fbf1206831e0';
  final String _baseUrl = 'http://api.mediastack.com/v1/news';

  Future<List<dynamic>> fetchNews({String language = 'es', String country = 'ar'}) async {
    final url = Uri.parse('$_baseUrl?access_key=$_apiKey&languages=$language&countries=$country');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data']; // Retorna los datos de la API
=======
  final String _apiKey = '9e4de6acaf1ea61c4c40fbf1206831e0'; 
  final String _baseUrl = 'http://api.mediastack.com/v1/news';

Future<List<Map<String, dynamic>>> fetchTopNews({String language = 'es', String country = 'ar'}) async {
    final url = Uri.parse('$_baseUrl?access_key=$_apiKey&languages=$language&countries=$country');

 final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['data'];

      return articles.map((article) {
        return {
          'title': article['title'] ?? 'Sin título',
          'imageUrl': article['image'] ?? 'https://via.placeholder.com/150',
          'source': article['source'] ?? 'Desconocido',
          'url': article['url'] ?? '',
        };
      }).toList();
>>>>>>> feddd26ce4d79aca005a27bdac6300e9efb5e09b
    } else {
      throw Exception('Error al obtener noticias: ${response.statusCode}');
    }
  }
<<<<<<< HEAD

  Future<List<Map<String, dynamic>>> fetchTopNews() async {
    final url = Uri.parse('$_baseUrl?access_key=$_apiKey&categories=general&limit=10'); // URL modificada para MediaStack API
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['data']; // 'data' contiene los artículos en MediaStack API

      return articles.map((article) {
        return {
          'title': article['title'] ?? 'Sin título',
          'imageUrl': article['image'] ?? 'https://via.placeholder.com/150', // 'image' contiene la URL de la imagen
          'source': article['source'] ?? 'Desconocido',
          'url': article['url'] ?? '',
        };
      }).toList();
    } else {
      throw Exception('Error al obtener noticias destacadas');
    }
  }
}
=======
}
>>>>>>> feddd26ce4d79aca005a27bdac6300e9efb5e09b
