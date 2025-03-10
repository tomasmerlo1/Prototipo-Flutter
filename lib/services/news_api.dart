import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class NewsApi {
  final String _baseUrl = "${dotenv.env['API_URL']}";

  Future<List<Map<String, dynamic>>> fetchTopNews(
      {String language = 'es', String country = 'ar'}) async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data;

      return articles.map((article) {
        return {
          'title': article['title'] ?? 'Sin título',
          'description': article['description'] ?? '',
          'content': article['content'] ?? '',
          'image': article['image'] ?? '',
          'author': article['author'] ?? '',
          'published_at': article['published_at'] ?? '',
          'source': article['source'] ?? 'Desconocido',
          'url': article['url'] ?? '',
        };
      }).toList();
    } else {
      throw Exception('Error al obtener noticias: ${response.statusCode}');
    }
  }
}
