import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aplication_noticias/models/noticias_model.dart'; // Importa el modelo Noticias

class NewsProvider with ChangeNotifier {
  List<Noticias> _news = []; // Cambia el tipo de la lista a Noticias

  List<Noticias> get news => _news;

  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse('http://localhost:3000/api/news'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      _news = data.map((item) => Noticias.fromJson(item)).toList(); // Convierte los mapas a objetos Noticias
      await saveNewsToLocalStorage();
      notifyListeners();
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<void> loadNewsFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? newsData = prefs.getString('news_data');
    if (newsData != null) {
      final List<dynamic> data = json.decode(newsData);
      _news = data.map((item) => Noticias.fromJson(item)).toList(); // Convierte los mapas a objetos Noticias
      notifyListeners();
    }
  }

  Future<void> saveNewsToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> newsJson = _news.map((noticia) => noticia.toJson()).toList(); // Convierte los objetos Noticias a mapas
    await prefs.setString('news_data', json.encode(newsJson));
  }

  void addNews(Noticias article) { //cambio el tipo de article a noticias
    _news.add(article);
    saveNewsToLocalStorage();
    notifyListeners();
  }

  void removeNews(int index) {
    _news.removeAt(index);
    saveNewsToLocalStorage();
    notifyListeners();
  }
}