import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApi {
<<<<<<< HEAD
  final String _apiKey = '9e4de6acaf1ea61c4c40fbf1206831e0';
  final String _baseUrl = 'http://api.mediastack.com/v1/news';

 
  Future<List<dynamic>> fetchNews({String language = 'es', String country = 'ar'}) async {
    final url = Uri.parse('$_baseUrl?access_key=$_apiKey&languages=$language&countries=$country');
=======
  final String apiKey = '92506cef0cb18679bc9f7303c333bf51';
  final String baseUrl = 'https://newsapi.org/v2';
>>>>>>> b707ee37b3719263476fac57dbea40452732e733

  Future<List<Map<String, dynamic>>> fetchTopNews() async {
    final url = Uri.parse('$baseUrl/top-headlines?country=ar&apiKey=$apiKey');
    
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articles = data['articles'];

      return articles.map((article) {
        return {
          'title': article['title'] ?? 'Sin título',
          'imageUrl': article['urlToImage'] ?? 'https://via.placeholder.com/150',
          'source': article['source']['name'] ?? 'Desconocido',
          'url': article['url'] ?? '',
        };
      }).toList();
    } else {
      throw Exception('Error al obtener noticias');
    }
  }
}
