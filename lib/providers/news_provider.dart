import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  List<String> _news = [];

  List<String> get news => _news;

  void addNews(String article) {
    _news.add(article);
    notifyListeners();
  }

  void removeNews(int index) {
    _news.removeAt(index);
    notifyListeners();
  }
}