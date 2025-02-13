import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class NewsProvider with ChangeNotifier {
  List<Map<String, dynamic>> _news = [];

  List<Map<String, dynamic>> get news => _news;

  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse('http://localhost:3000/api/news'));

    if (response.statusCode == 200) {
      _news = List<Map<String, dynamic>>.from(json.decode(response.body));
      await saveNewsToLocalStorage(); // Guarda en local al traer nuevas noticias
      notifyListeners();
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<void> loadNewsFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? newsData = prefs.getString('news_data');
    if (newsData != null) {
      _news = List<Map<String, dynamic>>.from(json.decode(newsData));
      notifyListeners();
    }
  }

  Future<void> saveNewsToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('news_data', json.encode(_news));
  }

  void addNews(Map<String, dynamic> article) {
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
