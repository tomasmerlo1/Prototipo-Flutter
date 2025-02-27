import 'package:flutter/material.dart';
import 'package:aplication_noticias/services/news_api.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final NewsApi _newsApi = NewsApi();
  late Future<List<dynamic>> _news;
  String _query = '';
  List<dynamic> _filteredNews = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  void _fetchNews() async {
    final news = await _newsApi.fetchTopNews();
    setState(() {
      _filteredNews = news;
    });
  }

  void _filterNews(String query) {
    setState(() {
      _query = query;
      _filteredNews = _filteredNews
          .where((article) =>
              article['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterNews,
              decoration: InputDecoration(
                hintText: "Buscar noticias...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: _filteredNews.isEmpty
                ? Center(child: Text("No hay resultados"))
                : ListView.builder(
                    itemCount: _filteredNews.length,
                    itemBuilder: (context, index) {
                      final article = _filteredNews[index];
                      return ListTile(
                        leading: article['urlToImage'] != null
                            ? Image.network(article['urlToImage'],
                                width: 100, fit: BoxFit.cover)
                            : null,
                        title: Text(article['title']),
                        subtitle: Text(article['description'] ?? ''),
                        onTap: () {
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
