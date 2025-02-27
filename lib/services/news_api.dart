import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApi {
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
          'description': article['description'] ?? '',
          'content': article['content'] ?? '',
          'image': article['image'] ?? '',
          'author': article['author'] ?? '',
          'published_at': article['published_at'] ?? '',
          'category': article['category'],
          'source': article['source'] ?? 'Desconocido',
          'url': article['url'] ?? '',
        };
      }).toList();
    } else {
      throw Exception('Error al obtener noticias: ${response.statusCode}');
    }
  }
}